﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TodoPagos.AdminForm.Form
{
    public partial class AvailableProductsUserControl : UserControl
    {
        private PrincipalUserControl principalUserControl;

        public AvailableProductsUserControl(PrincipalUserControl principalUserControl)
        {
            this.principalUserControl = principalUserControl;
            InitializeComponent();
        }
    }
}