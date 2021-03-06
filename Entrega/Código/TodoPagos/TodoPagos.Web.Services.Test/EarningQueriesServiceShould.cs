﻿using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using TodoPagos.Domain.Repository;
using Moq;
using System.Collections.Generic;
using TodoPagos.Domain;
using System.Linq;
using TodoPagos.UserAPI;

namespace TodoPagos.Web.Services.Tests
{
    [TestClass]
    public class EarningQueriesServiceShould
    {
        [TestMethod]
        public void ReceiveAUnitOfWorkOnCreation()
        {
            var mockUnitOfWork = new Mock<IUnitOfWork>();

            EarningQueriesService service = new EarningQueriesService(mockUnitOfWork.Object);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException))]
        public void FailIfUnitOfWorkOnCreationIsNull()
        {
            IUnitOfWork mockUnitOfWork = null;

            EarningQueriesService service = new EarningQueriesService(mockUnitOfWork);
        }

        [TestMethod]
        public void BeAbleToGetEarningsPerProvider()
        {
            Payment payment = CreateNewPayment();
            List<Payment> paymentsList = new List<Payment>();
            paymentsList.Add(payment);
            var mockUnitOfWork = new Mock<IUnitOfWork>();
            mockUnitOfWork.Setup(x => x.PaymentRepository.Get(null, null, "")).Returns(paymentsList);
            mockUnitOfWork.Setup(x => x.CurrentSignedInUserHasRequiredPrivilege(It.IsAny<string>(),
                EarningQueriesPrivilege.GetInstance())).Returns(true);
            EarningQueriesService earningQueries = new EarningQueriesService(mockUnitOfWork.Object);

            IDictionary<Provider, double> resultingDictionary = earningQueries.GetEarningsPerProvider(DateTime.Today, DateTime.Today, It.IsAny<string>());

            mockUnitOfWork.VerifyAll();
            Assert.AreEqual(3, resultingDictionary.First().Value);
        }

        private Payment CreateNewPayment()
        {
            List<IField> emptyFields = new List<IField>();
            NumberField field = new NumberField("Monto");
            emptyFields.Add(field);
            IField filledField = field.FillAndClone("100");
            List<IField> fullFields = new List<IField>();
            fullFields.Add(filledField);
            Provider provider = new Provider("Antel", 3, emptyFields);
            Receipt receipt = new Receipt(provider, fullFields, 100);
            List<Receipt> list = new List<Receipt>();
            list.Add(receipt);
            return new Payment(new CashPayMethod(DateTime.Today), 100, list);
        }

        [TestMethod]
        public void BeAbleToGetAllEarnings()
        {
            Payment payment = CreateNewPayment();
            List<Payment> paymentsList = new List<Payment>();
            paymentsList.Add(payment);
            var mockUnitOfWork = new Mock<IUnitOfWork>();
            mockUnitOfWork.Setup(x => x.PaymentRepository.Get(null, null, "")).Returns(paymentsList);
            mockUnitOfWork.Setup(x => x.CurrentSignedInUserHasRequiredPrivilege(It.IsAny<string>(),
                EarningQueriesPrivilege.GetInstance())).Returns(true);
            EarningQueriesService earningQueries = new EarningQueriesService(mockUnitOfWork.Object);

            double resultingValue = earningQueries.GetAllEarnings(DateTime.Today, DateTime.Today, It.IsAny<string>());

            mockUnitOfWork.VerifyAll();
            Assert.AreEqual(3, resultingValue);
        }

        [TestMethod]
        [ExpectedException(typeof(UnauthorizedAccessException))]
        public void FailWithUnauthorizedAccessExceptionIfUserTriesToAccessAnythingWithoutEarningQueriesPrivilege()
        {
            var mockUnitOfWork = new Mock<IUnitOfWork>();
            mockUnitOfWork
                .Setup(un => un.CurrentSignedInUserHasRequiredPrivilege(It.IsAny<string>(), EarningQueriesPrivilege.GetInstance()))
                .Returns(false);
            EarningQueriesService earningQueriesService = new EarningQueriesService(mockUnitOfWork.Object);

            double result = earningQueriesService.GetAllEarnings(DateTime.Today, DateTime.Today, It.IsAny<string>());
        }
    }
}
