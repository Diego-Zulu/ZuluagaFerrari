﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace TodoPagos.UserAPI
{
    public abstract class Role
    {

        public string Name { get; set; }

        public int ID { get; set; }

        public ICollection<User> usersThatHaveThisRole { get; set; } = new List<User>();

        public virtual ICollection<Privilege> Privileges { get; set; } = new List<Privilege>();

        public override bool Equals(Object anObject)
        {
            try {
                Role castedObject = (Role)anObject;
                return this.IsEqualRole(castedObject);
            } catch (System.InvalidCastException)
            {
                return false;
            }
        }

        private bool IsEqualRole(Role anotherRole)
        {
            bool isEqualRole = false;
            if (anotherRole != null)
            {
                isEqualRole = this.Name.Equals(anotherRole.Name);
            }
            return isEqualRole;
        }

        public override int GetHashCode()
        {
            return this.Name.GetHashCode();
        }

        public bool HasPrivilege(Privilege onePrivilege)
        {
            bool hasPrivilege = false;
            if (onePrivilege != null)
            {
                hasPrivilege = Privileges.Contains(onePrivilege);
            }
            return hasPrivilege;
        }

        public int GetPrivilegeCount()
        {
            return this.Privileges.Count;
        }
    }
}
