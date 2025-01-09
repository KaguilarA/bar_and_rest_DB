CALL bar_rest.CreatePromo(
    'Balde de birras nacionales',
    'Promo de 6 birras nacionales a precio especial',
    7500,
    'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',
    'imagetest',
    6,
    '2024-12-31',
    1,
    1,
    '[1, 2, 3, 4, 5, 6, 7, 8]'
);

CALL bar_rest.CreatePromo(
    'Balde de birras extranjeras',
    'Promo de 6 birras extranjeras a precio especial',
    8000,
    'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',
    'imagetest',
    6,
    '2024-12-31',
    1,
    1,
    '[9, 10, 11, 12]'
);

CALL bar_rest.CreatePromo(
    'Jueves de chifrijo',
    'Promo de 1 birra nacional y un chifrijo a precio especial los días jueves',
    8000,
    'Thursday',
    'imagetest',
    2,
    '2024-12-31',
    1,
    1,
    '[1, 2, 3, 4, 5, 6, 7, 8, 38]'
);