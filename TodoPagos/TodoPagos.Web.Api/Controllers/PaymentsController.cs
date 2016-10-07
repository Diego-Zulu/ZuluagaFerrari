﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using TodoPagos.Web.Services;

namespace TodoPagos.Web.Api.Controllers
{
    [RoutePrefix("api/v1/payments")]
    public class PaymentsController : ApiController
    {

        private readonly IPaymentService paymentService;

        public PaymentsController(IPaymentService service)
        {
            paymentService = service;
        }
    }
}