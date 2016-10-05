﻿using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using TodoPagos.Domain;
using System.Collections.Generic;

namespace TodoPagos.Domain.Tests
{
    [TestClass]
    public class ReceiptShould
    {

        [TestMethod]
        public void BeAbleToTellItsProvider()
        {
            List<IField> list = new List<IField>();
            NumberField aNumberField = new NumberField("ID");
            list.Add(aNumberField);
            Provider provider = new Provider("Antel", 20, list);
            IField completedNumberField = aNumberField.FillAndClone("8000");
            List<IField> completedFields = new List<IField>();
            completedFields.Add(completedNumberField);

            Receipt receipt = new Receipt(provider, completedFields, 0);

            Assert.AreEqual(provider, receipt.ReceiptProvider);
        }

        [TestMethod]
        public void HaveTheNecessaryCompletedFields()
        {
            List<IField> list = new List<IField>();
            NumberField aNumberField = new NumberField("Kamen Rider");
            list.Add(aNumberField);
            Provider provider = new Provider("Antel", 20, list);
            DateField datefield = new DateField("Fecha");
            NumberField numberField = new NumberField("Monto");
            IField completedDateField = datefield.FillAndClone("01/02/2014");
            IField completedNumberField = numberField.FillAndClone("8000");
            List<IField> completedFields = new List<IField>();
            completedFields.Add(completedDateField);
            completedFields.Add(completedNumberField);
        
            Receipt receipt = new Receipt(provider, completedFields, 0);

            Assert.IsTrue(completedFields.TrueForAll
                (field => receipt.ContainsField(field)));
        }

        [TestMethod]
        public void KnowTheAmountToBePaid()
        {
            List<IField> list = new List<IField>();
            NumberField aNumberField = new NumberField("Coordenada X");
            list.Add(aNumberField);
            Provider provider = new Provider("Antel", 20, list);
            double amount = 10000;
            IField completedNumberField = aNumberField.FillAndClone("8000");
            List<IField> completedFields = new List<IField>();
            completedFields.Add(completedNumberField);

            Receipt receipt = new Receipt(provider, completedFields, amount);

            Assert.AreEqual(amount, receipt.Amount);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException))]
        public void FailIfAmountIsLessThanZero()
        {
            List<IField> list = new List<IField>();
            TextField aTextField = new TextField("Apellido");
            list.Add(aTextField);
            Provider provider = new Provider("Antel", 20, list);
            double amount = -1;

            Receipt receipt = new Receipt(provider, new List<IField>(), amount);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException))]
        public void FailIfNullFields()
        {
            List<IField> list = new List<IField>();
            DateField aDateField = new DateField("Fecha");
            list.Add(aDateField);
            Provider provider = new Provider("Antel", 20, list);
            double amount = 10000;

            Receipt receipt = new Receipt(provider, null, amount);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException))]
        public void FailIfOneFieldIsEmpty()
        {
            List<IField> emptyFieldsList = new List<IField>();
            DateField aDateField = new DateField("Fecha");
            emptyFieldsList.Add(aDateField);
            Provider provider = new Provider("Antel", 20, emptyFieldsList);
            double amount = 10000;

            List<IField> completeFieldsList = new List<IField>();
            completeFieldsList.Add(aDateField);

            Receipt receipt = new Receipt(provider, completeFieldsList, amount);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException))]
        public void HaveMinimumOneField()
        {
            List<IField> list = new List<IField>();
            DateField aDateField = new DateField("Fecha");
            list.Add(aDateField);
            Provider provider = new Provider("Antel", 20, list);
            double amount = 10000;

            Receipt receipt = new Receipt(provider, new List<IField>(), amount);
        }
    }
}