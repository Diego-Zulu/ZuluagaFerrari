﻿using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using TodoPagos.Web.Api.Controllers;
using Moq;
using TodoPagos.Web.Services;

namespace TodoPagos.Web.Api.Tests
{
    [TestClass]
    public class PaymentsControllerShould
    {
        [TestMethod]
        public void RecieveAPaymentServiceOnCreation()
        {
            var mockPaymentService = new Mock<IPaymentService>();

            PaymentsController controller = new PaymentsController(mockPaymentService.Object);
        }
    }
}
