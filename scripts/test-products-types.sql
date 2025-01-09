-- Insert default product types for a bar business

CALL bar_rest.CreateProductType('Bebida vidrio', TRUE);
CALL bar_rest.CreateProductType('Bebida enlatada', TRUE);
CALL bar_rest.CreateProductType('Boca', FALSE);
CALL bar_rest.CreateProductType('Entrada', FALSE);
CALL bar_rest.CreateProductType('Snack', TRUE);
CALL bar_rest.CreateProductType('Shot', FALSE);
CALL bar_rest.CreateProductType('Trago pequeño', FALSE);
CALL bar_rest.CreateProductType('Trago grande', FALSE);
CALL bar_rest.CreateProductType('Cuarta', FALSE);
CALL bar_rest.CreateProductType('Media', FALSE);
CALL bar_rest.CreateProductType('Bebida caliente', FALSE);