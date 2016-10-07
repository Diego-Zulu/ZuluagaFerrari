﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using TodoPagos.Web.Services;
using TodoPagos.Domain;
using System.Web.Http.Description;

namespace TodoPagos.Web.Api.Controllers
{
    [RoutePrefix("api/v1/Providers")]
    public class ProvidersController : ApiController
    {
        private readonly IProviderService providerService;

        public ProvidersController(IProviderService oneService)
        {
            MakeSureProvidedProviderServiceIsNotNull(oneService);
            providerService = oneService;
        }

        private void MakeSureProvidedProviderServiceIsNotNull(IProviderService providedProviderService)
        {
            if (providedProviderService == null)
            {
                throw new ArgumentException();
            }
        }

        [HttpGet]
        public IHttpActionResult GetProviders()
        {
            IEnumerable<Provider> users = providerService.GetAllProviders();
            return Ok(users);
        }

        [HttpGet]
        [ResponseType(typeof(Provider))]
        public IHttpActionResult GetProvider(int id)
        {
            try
            {
                Provider targetProvider = providerService.GetSingleProvider(id);
                return Ok(targetProvider);
            } catch (ArgumentOutOfRangeException)
            {
                return NotFound();
            }
        }

        [ResponseType(typeof(void))]
        public IHttpActionResult PutProvider(int id, Provider oneProvider)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            else
            {
                return tryToUpdateProvider(id, oneProvider);
            }
        }

        private IHttpActionResult tryToUpdateProvider(int id, Provider oneProvider)
        {
            if (!providerService.UpdateProvider(id, oneProvider))
            {
                return DecideWhatErrorMessageToReturn(id, oneProvider);
            }
            return StatusCode(HttpStatusCode.NoContent);
        }

        private IHttpActionResult DecideWhatErrorMessageToReturn(int id, Provider oneProvider)
        {
            if (oneProvider == null || id != oneProvider.ID)
            {
                return BadRequest();
            }
            else
            {
                return NotFound();
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                providerService.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
