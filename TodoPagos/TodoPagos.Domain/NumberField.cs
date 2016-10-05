﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TodoPagos.Domain
{
    public class NumberField : IField
    {
        public long Data { get; set; }

        public string Name { get; set; }

        public bool Empty { get; set; }

        public NumberField(string aName)
        {
            Name = aName;
            Empty = true;
        }

        public override IField FillAndClone(string dataToFillWith)
        {
            CheckForNullOrNotNumericArgument(dataToFillWith);
            NumberField newNumberField = new NumberField(Name);
            newNumberField.Data = long.Parse(dataToFillWith);
            newNumberField.Empty = false;
            return newNumberField;
        }

        private void CheckForNullOrNotNumericArgument(string dataToFillWith)
        {
            if (String.IsNullOrEmpty(dataToFillWith)) throw new ArgumentException();
            try
            {
                long.Parse(dataToFillWith);
            }
            catch (FormatException)
            {
                throw new ArgumentException();
            }
        }

        public override string GetData()
        {
            return Data.ToString();
        }

        public override bool IsValid()
        {
            return Data > 0;
        }

        public override bool Equals(object otherIField)
        {
            if (IsNull(otherIField)) return false;
            try
            {
                NumberField otherNumberField = (NumberField)otherIField;
                return GetData().Equals(otherNumberField.GetData()) &&
                    Name.Equals(otherNumberField.Name);
            }
            catch (InvalidCastException)
            {
                return false;
            }
        }

        private bool IsNull(object anObject)
        {
            return anObject == null;
        }

        public override int GetHashCode()
        {
            return Data.GetHashCode();
        }

        public override bool IsEmpty()
        {
            return Empty;
        }
    }
}