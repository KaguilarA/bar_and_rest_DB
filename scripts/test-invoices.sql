-- Insert default invoices

CALL bar_rest.CreateInvoice('Mesa 1', 3, 1);
CALL bar_rest.CreateInvoice('Mesa 2', 3, 1);
CALL bar_rest.CreateInvoice('Barra 5', 3, 1);
CALL bar_rest.CreateInvoice('Mesa 6', 3, 1);

CALL bar_rest.AddProductToInvoice(1, 1, 1);
CALL bar_rest.AddPromoToInvoice(2, 1, '[1, 1, 1, 3, 3, 3]');