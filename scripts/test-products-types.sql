-- Insert default product types for a bar business

CALL bar_rest.CreateProductType('Bebida vidrio', TRUE);
CALL bar_rest.CreateProductType('Bebida enlatada', TRUE);
CALL bar_rest.CreateProductType('Boca', FALSE);
CALL bar_rest.CreateProductType('Snack', TRUE);
CALL bar_rest.CreateProductType('Trago', FALSE);
