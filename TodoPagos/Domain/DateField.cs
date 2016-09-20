﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class DateField : IField
    {
        public DateTime Data { get; set; }

        public override IField FillAndClone(string dataToBeFilledWith)
        {
            DateField newDateField = new DateField();
            newDateField.Data = DateTime.ParseExact(dataToBeFilledWith, "d", null);
            return newDateField;
        }

        public override string GetData()
        {
            return Data.ToShortDateString();
        }

        public override bool IsValid()
        {
            throw new NotImplementedException();
        }
    }
}
