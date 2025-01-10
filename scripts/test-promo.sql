-- Insert default states

CALL bar_rest.CreatePromo('Balde de birras nacionales', 'Promo de 6 birras nacionales a precio especial', 7500, 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday', 'imagetest', 6, '2024-12-31', 1, 1, '[1, 2, 3, 4, 5, 6, 7, 8]');
CALL bar_rest.CreatePromo('Balde de birras extranjeras', 'Promo de 6 birras extranjeras a precio especial', 8000, 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday', 'imagetest', 6, '2024-12-31', 1, 1, '[9, 10, 11, 12]');
CALL bar_rest.CreatePromo('Jueves de chifrijo', 'Promo de 1 birra nacional y un chifrijo a precio especial los días jueves', 4500, 'Thursday', 'imagetest', 2, '2024-12-31', 1, 1, '[1, 2, 3, 4, 5, 6, 7, 8, 39]');
CALL bar_rest.CreatePromo('Promo shots de chiliguaro', 'Promo de 2 shots de chiliguaro de sabor a escoger a precio especial', 1000, 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday', 'imagetest', 2, '2024-12-31', 1, 1, '[56, 60, 64, 68, 72]');
CALL bar_rest.CreatePromo('Promo shots Whisky', 'Promo de un shots de Whisky en marcas seleccionadas a precio especial', 1000, 'Monday,Tuesday,Wednesday,Thursday', 'imagetest', 2, '2024-12-31', 1, 1, '[96, 101, 106, 111]');