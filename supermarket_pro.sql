-- ============================================================
--  SUPERMARKET PRO DATABASE
--  Large practice dataset for advanced SQL learning
--  Tables: categories, suppliers, products, warehouse_stock,
--          stock_movements, employees, customers, orders, order_items
-- ============================================================

CREATE DATABASE IF NOT EXISTS supermarket_pro;
USE supermarket_pro;

-- ============================================================
-- TABLE 1: categories (15 categories)
-- ============================================================
CREATE TABLE categories (
    category_id   INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL
);

INSERT INTO categories (category_name) VALUES
('Beverages'),
('Dairy'),
('Bakery'),
('Snacks'),
('Fruits & Vegetables'),
('Meat & Poultry'),
('Seafood'),
('Frozen Foods'),
('Cleaning Supplies'),
('Personal Care'),
('Baby Products'),
('Canned Goods'),
('Condiments & Sauces'),
('Grains & Cereals'),
('Confectionery');


-- ============================================================
-- TABLE 2: suppliers (20 suppliers)
-- ============================================================
CREATE TABLE suppliers (
    supplier_id   INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100) NOT NULL,
    city          VARCHAR(50),
    contact_phone VARCHAR(20),
    email         VARCHAR(100),
    rating        DECIMAL(3,1)
);

INSERT INTO suppliers (supplier_name, city, contact_phone, email, rating) VALUES
('FreshFarm Co.',        'Lahore',      '0300-1111111', 'freshfarm@email.com',     4.5),
('DairyBest Ltd.',       'Karachi',     '0300-2222222', 'dairybest@email.com',     4.8),
('BakePro Supplies',     'Islamabad',   '0300-3333333', 'bakepro@email.com',       4.2),
('SnackWorld Inc.',      'Lahore',      '0300-4444444', 'snackworld@email.com',    4.0),
('GreenLeaf Farms',      'Multan',      '0300-5555555', 'greenleaf@email.com',     4.7),
('MeatMaster Co.',       'Karachi',     '0300-6666666', 'meatmaster@email.com',    4.3),
('OceanFresh Seafood',   'Karachi',     '0300-7777777', 'oceanfresh@email.com',    4.1),
('FrostBite Frozen',     'Lahore',      '0300-8888888', 'frostbite@email.com',     3.9),
('CleanZone Ltd.',       'Lahore',      '0300-9999999', 'cleanzone@email.com',     4.4),
('CareFirst Supplies',   'Islamabad',   '0301-1111111', 'carefirst@email.com',     4.6),
('TinyTots Baby Co.',    'Karachi',     '0301-2222222', 'tinytots@email.com',      4.9),
('CanPack Industries',   'Faisalabad',  '0301-3333333', 'canpack@email.com',       3.8),
('SauceMaster Ltd.',     'Lahore',      '0301-4444444', 'saucemaster@email.com',   4.2),
('GrainPlus Co.',        'Multan',      '0301-5555555', 'grainplus@email.com',     4.5),
('SweetTooth Confect.',  'Islamabad',   '0301-6666666', 'sweettooth@email.com',    4.3),
('NatureFresh Farms',    'Peshawar',    '0301-7777777', 'naturefresh@email.com',   4.6),
('HealthyLife Co.',      'Lahore',      '0301-8888888', 'healthylife@email.com',   4.7),
('QuickFreeze Ltd.',     'Karachi',     '0301-9999999', 'quickfreeze@email.com',   4.0),
('SpiceLand Inc.',       'Hyderabad',   '0302-1111111', 'spiceland@email.com',     4.4),
('MegaSupply Corp.',     'Lahore',      '0302-2222222', 'megasupply@email.com',    3.7);


-- ============================================================
-- TABLE 3: products (100 products)
-- ============================================================
CREATE TABLE products (
    product_id    INT PRIMARY KEY AUTO_INCREMENT,
    product_name  VARCHAR(100) NOT NULL,
    category_id   INT,
    supplier_id   INT,
    unit_price    DECIMAL(8,2),
    unit_type     VARCHAR(20),
    is_active     BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

INSERT INTO products (product_name, category_id, supplier_id, unit_price, unit_type) VALUES
-- Beverages (cat 1)
('Mineral Water 1L',         1,  1,   25.00, 'bottle'),
('Orange Juice 1L',          1,  1,   95.00, 'bottle'),
('Mango Juice 1L',           1,  1,  110.00, 'bottle'),
('Apple Juice 500ml',        1,  1,   85.00, 'bottle'),
('Green Tea 20 bags',        1, 17,  180.00, 'box'),
('Black Tea 100g',           1, 17,   95.00, 'pack'),
('Coffee Instant 200g',      1, 17,  450.00, 'jar'),
('Energy Drink 250ml',       1,  4,  120.00, 'can'),
-- Dairy (cat 2)
('Milk Full Cream 1L',       2,  2,  180.00, 'packet'),
('Milk Skimmed 1L',          2,  2,  175.00, 'packet'),
('Yogurt Plain 500g',        2,  2,  120.00, 'cup'),
('Yogurt Flavored 200g',     2,  2,   85.00, 'cup'),
('Cheese Slices 200g',       2,  2,  250.00, 'pack'),
('Cheddar Block 500g',       2,  2,  480.00, 'pack'),
('Butter Salted 200g',       2,  2,  320.00, 'pack'),
('Cream Fresh 200ml',        2,  2,  150.00, 'bottle'),
-- Bakery (cat 3)
('White Bread 400g',         3,  3,   90.00, 'loaf'),
('Brown Bread 400g',         3,  3,  110.00, 'loaf'),
('Croissant Plain',          3,  3,   60.00, 'piece'),
('Burger Buns 6pcs',         3,  3,  120.00, 'pack'),
('Pita Bread 6pcs',          3,  3,  130.00, 'pack'),
('Cake Slice Chocolate',     3,  3,  150.00, 'piece'),
('Muffin Blueberry',         3,  3,   80.00, 'piece'),
('Bagel Plain',              3,  3,   70.00, 'piece'),
-- Snacks (cat 4)
('Lays Classic 100g',        4,  4,   70.00, 'pack'),
('Lays Masala 100g',         4,  4,   70.00, 'pack'),
('Oreo Biscuits 137g',       4,  4,   95.00, 'pack'),
('Digestive Biscuits 400g',  4,  4,  180.00, 'pack'),
('Chocolate Bar Dark 100g',  4, 15,  150.00, 'bar'),
('Chocolate Bar Milk 100g',  4, 15,  140.00, 'bar'),
('Popcorn Salted 100g',      4,  4,   60.00, 'pack'),
('Crackers Whole Wheat',     4,  4,  120.00, 'pack'),
-- Fruits & Vegetables (cat 5)
('Bananas 1kg',              5,  5,   80.00, 'kg'),
('Apples 1kg',               5,  5,  150.00, 'kg'),
('Oranges 1kg',              5,  5,  120.00, 'kg'),
('Tomatoes 1kg',             5,  5,   60.00, 'kg'),
('Potatoes 1kg',             5,  5,   50.00, 'kg'),
('Onions 1kg',               5,  5,   40.00, 'kg'),
('Spinach 500g',             5, 16,   70.00, 'bag'),
('Carrots 1kg',              5,  5,   65.00, 'kg'),
-- Meat & Poultry (cat 6)
('Chicken Breast 1kg',       6,  6,  550.00, 'kg'),
('Chicken Whole 1kg',        6,  6,  420.00, 'kg'),
('Beef Mince 500g',          6,  6,  480.00, 'pack'),
('Beef Steak 500g',          6,  6,  650.00, 'pack'),
('Mutton Chops 500g',        6,  6,  750.00, 'pack'),
('Sausages Beef 300g',       6,  6,  320.00, 'pack'),
('Lamb Mince 500g',          6,  6,  580.00, 'pack'),
('Turkey Breast 500g',       6,  6,  520.00, 'pack'),
-- Seafood (cat 7)
('Prawns Large 500g',        7,  7,  850.00, 'pack'),
('Fish Fillet 500g',         7,  7,  650.00, 'pack'),
('Tuna Steak 300g',          7,  7,  580.00, 'pack'),
('Salmon Fillet 300g',       7,  7,  950.00, 'pack'),
-- Frozen Foods (cat 8)
('Frozen Peas 500g',         8,  8,  120.00, 'bag'),
('Frozen Corn 500g',         8,  8,  110.00, 'bag'),
('Frozen Pizza Margherita',  8,  8,  650.00, 'piece'),
('Frozen Burger Patties 4p', 8,  8,  480.00, 'pack'),
('Ice Cream Vanilla 1L',     8,  8,  380.00, 'tub'),
('Ice Cream Chocolate 1L',   8,  8,  380.00, 'tub'),
-- Cleaning Supplies (cat 9)
('Floor Cleaner 1L',         9,  9,  220.00, 'bottle'),
('Dishwash Liquid 500ml',    9,  9,  150.00, 'bottle'),
('Laundry Powder 1kg',       9,  9,  350.00, 'bag'),
('Fabric Softener 1L',       9,  9,  280.00, 'bottle'),
('Toilet Cleaner 500ml',     9,  9,  180.00, 'bottle'),
('Glass Cleaner 500ml',      9,  9,  160.00, 'bottle'),
('Bleach 1L',                9,  9,  120.00, 'bottle'),
('Trash Bags 30pcs',         9, 20,  150.00, 'pack'),
-- Personal Care (cat 10)
('Shampoo 200ml',           10, 10,  350.00, 'bottle'),
('Conditioner 200ml',       10, 10,  320.00, 'bottle'),
('Body Wash 250ml',         10, 10,  280.00, 'bottle'),
('Hand Soap 150g',          10, 10,  120.00, 'bar'),
('Toothpaste 100g',         10, 10,  200.00, 'tube'),
('Toothbrush Soft',         10, 10,   80.00, 'piece'),
('Deodorant Roll-on 50ml',  10, 10,  250.00, 'bottle'),
('Face Wash 100ml',         10, 10,  380.00, 'bottle'),
-- Baby Products (cat 11)
('Baby Diapers S 30pcs',    11, 11, 1200.00, 'pack'),
('Baby Diapers M 28pcs',    11, 11, 1350.00, 'pack'),
('Baby Wipes 80pcs',        11, 11,  380.00, 'pack'),
('Baby Shampoo 200ml',      11, 11,  450.00, 'bottle'),
('Baby Lotion 200ml',       11, 11,  420.00, 'bottle'),
('Baby Formula 400g',       11, 11, 2200.00, 'tin'),
-- Canned Goods (cat 12)
('Canned Tomatoes 400g',    12, 12,   95.00, 'can'),
('Canned Chickpeas 400g',   12, 12,  110.00, 'can'),
('Canned Corn 400g',        12, 12,   90.00, 'can'),
('Canned Tuna 185g',        12, 12,  180.00, 'can'),
-- Condiments (cat 13)
('Ketchup 500g',            13, 19,  150.00, 'bottle'),
('Mayonnaise 500g',         13, 19,  220.00, 'jar'),
('Soy Sauce 250ml',         13, 19,  120.00, 'bottle'),
('Hot Sauce 150ml',         13, 19,   95.00, 'bottle'),
('Mustard 200g',            13, 19,  130.00, 'jar'),
-- Grains & Cereals (cat 14)
('Basmati Rice 5kg',        14, 14,  950.00, 'bag'),
('Brown Rice 2kg',          14, 14,  480.00, 'bag'),
('Rolled Oats 500g',        14, 14,  280.00, 'pack'),
('Cornflakes 500g',         14, 14,  320.00, 'box'),
('Pasta Spaghetti 500g',    14, 14,  120.00, 'pack'),
('Flour All Purpose 1kg',   14, 14,   85.00, 'bag'),
-- Confectionery (cat 15)
('Gummy Bears 100g',        15, 15,   80.00, 'pack'),
('Lollipops 10pcs',         15, 15,   50.00, 'pack'),
('Marshmallows 200g',       15, 15,  120.00, 'pack'),
('Toffees Assorted 200g',   15, 15,  150.00, 'pack');


-- ============================================================
-- TABLE 4: warehouse_stock
-- ============================================================
CREATE TABLE warehouse_stock (
    stock_id       INT PRIMARY KEY AUTO_INCREMENT,
    product_id     INT,
    quantity       INT,
    reorder_level  INT,
    last_updated   DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO warehouse_stock (product_id, quantity, reorder_level, last_updated) VALUES
(1,500,100,'2025-09-01'),(2,200,50,'2025-09-01'),(3,180,50,'2025-09-01'),
(4,220,60,'2025-09-01'),(5,150,40,'2025-09-01'),(6,300,80,'2025-09-01'),
(7,80,30,'2025-09-01'),(8,250,70,'2025-09-01'),(9,300,80,'2025-09-02'),
(10,280,80,'2025-09-02'),(11,150,40,'2025-09-02'),(12,200,60,'2025-09-02'),
(13,80,30,'2025-09-02'),(14,60,25,'2025-09-02'),(15,90,30,'2025-09-02'),
(16,120,40,'2025-09-02'),(17,250,60,'2025-09-03'),(18,180,60,'2025-09-03'),
(19,100,30,'2025-09-03'),(20,150,50,'2025-09-03'),(21,120,40,'2025-09-03'),
(22,80,25,'2025-09-03'),(23,90,30,'2025-09-03'),(24,110,35,'2025-09-03'),
(25,400,100,'2025-09-04'),(26,380,100,'2025-09-04'),(27,220,60,'2025-09-04'),
(28,180,50,'2025-09-04'),(29,160,50,'2025-09-04'),(30,170,50,'2025-09-04'),
(31,200,60,'2025-09-04'),(32,150,45,'2025-09-04'),(33,300,80,'2025-09-05'),
(34,250,70,'2025-09-05'),(35,280,80,'2025-09-05'),(36,280,80,'2025-09-05'),
(37,350,100,'2025-09-05'),(38,400,100,'2025-09-05'),(39,200,60,'2025-09-05'),
(40,320,90,'2025-09-05'),(41,60,20,'2025-09-06'),(42,80,25,'2025-09-06'),
(43,45,20,'2025-09-06'),(44,30,15,'2025-09-06'),(45,25,15,'2025-09-06'),
(46,90,25,'2025-09-06'),(47,40,15,'2025-09-06'),(48,50,20,'2025-09-06'),
(49,35,15,'2025-09-07'),(50,40,15,'2025-09-07'),(51,30,12,'2025-09-07'),
(52,20,10,'2025-09-07'),(53,150,45,'2025-09-07'),(54,160,50,'2025-09-07'),
(55,40,15,'2025-09-07'),(56,35,12,'2025-09-07'),(57,45,15,'2025-09-07'),
(58,50,18,'2025-09-07'),(59,120,40,'2025-09-08'),(60,130,40,'2025-09-08'),
(61,100,35,'2025-09-08'),(62,90,30,'2025-09-08'),(63,80,25,'2025-09-08'),
(64,200,60,'2025-09-08'),(65,150,45,'2025-09-08'),(66,110,35,'2025-09-08'),
(67,25,10,'2025-09-09'),(68,20,10,'2025-09-09'),(69,80,25,'2025-09-09'),
(70,60,20,'2025-09-09'),(71,50,18,'2025-09-09'),(72,15,8,'2025-09-09'),
(73,180,55,'2025-09-10'),(74,160,50,'2025-09-10'),(75,200,60,'2025-09-10'),
(76,220,65,'2025-09-10'),(77,150,45,'2025-09-10'),(78,120,40,'2025-09-10'),
(79,350,100,'2025-09-11'),(80,280,80,'2025-09-11'),(81,200,60,'2025-09-11'),
(82,180,55,'2025-09-11'),(83,150,45,'2025-09-11'),(84,120,40,'2025-09-11'),
(85,90,30,'2025-09-12'),(86,100,35,'2025-09-12'),(87,80,25,'2025-09-12'),
(88,70,22,'2025-09-12'),(89,60,20,'2025-09-12'),(90,40,15,'2025-09-12'),
(91,300,90,'2025-09-13'),(92,280,85,'2025-09-13'),(93,250,75,'2025-09-13'),
(94,180,55,'2025-09-13'),(95,150,45,'2025-09-13'),(96,400,120,'2025-09-13'),
(97,200,60,'2025-09-14'),(98,180,55,'2025-09-14'),(99,150,45,'2025-09-14'),
(100,120,40,'2025-09-14');
 SELECT COUNT(*) FROM products;
 SELECT product_id, product_name FROM products ORDER BY product_id;

INSERT INTO products (product_name, category_id, supplier_id, unit_price, unit_type)
VALUES ('Toffees Assorted 200g', 15, 15, 150.00, 'pack');

-- ============================================================
-- TABLE 5: employees (25 employees)
-- ============================================================
CREATE TABLE employees (
    employee_id   INT PRIMARY KEY AUTO_INCREMENT,
    first_name    VARCHAR(50),
    last_name     VARCHAR(50),
    department    VARCHAR(50),
    position      VARCHAR(50),
    salary        DECIMAL(10,2),
    hire_date     DATE,
    is_active     BOOLEAN DEFAULT TRUE
);

INSERT INTO employees (first_name, last_name, department, position, salary, hire_date) VALUES
('Ahmed',   'Khan',     'Management',  'Store Manager',        85000.00, '2020-01-15'),
('Sara',    'Ali',      'Management',  'Assistant Manager',    65000.00, '2020-03-20'),
('Bilal',   'Hassan',   'Warehouse',   'Warehouse Manager',    55000.00, '2020-06-10'),
('Fatima',  'Sheikh',   'Sales',       'Sales Supervisor',     45000.00, '2021-01-05'),
('Omar',    'Malik',    'Warehouse',   'Stock Controller',     38000.00, '2021-03-15'),
('Ayesha',  'Ahmed',    'Sales',       'Sales Associate',      32000.00, '2021-06-20'),
('Zain',    'Hussain',  'Warehouse',   'Stock Associate',      30000.00, '2021-09-10'),
('Hina',    'Qureshi',  'Sales',       'Sales Associate',      32000.00, '2022-01-15'),
('Usman',   'Farooq',   'Warehouse',   'Stock Associate',      30000.00, '2022-03-20'),
('Nadia',   'Iqbal',    'HR',          'HR Manager',           60000.00, '2020-08-01'),
('Tariq',   'Butt',     'Finance',     'Finance Manager',      70000.00, '2020-09-15'),
('Sana',    'Chaudhry', 'Sales',       'Sales Associate',      32000.00, '2022-06-10'),
('Hamza',   'Mirza',    'Warehouse',   'Stock Associate',      30000.00, '2022-09-05'),
('Rabia',   'Siddiqui', 'HR',          'HR Associate',         35000.00, '2023-01-10'),
('Adnan',   'Raza',     'Finance',     'Finance Associate',    40000.00, '2023-03-15'),
('Zara',    'Nawaz',    'Sales',       'Sales Associate',      32000.00, '2023-06-20'),
('Faisal',  'Baig',     'Warehouse',   'Stock Associate',      30000.00, '2023-09-10'),
('Mariam',  'Javed',    'Sales',       'Sales Associate',      32000.00, '2024-01-15'),
('Kamran',  'Ashraf',   'Warehouse',   'Stock Associate',      30000.00, '2024-03-20'),
('Lubna',   'Zahid',    'Sales',       'Cashier',              28000.00, '2024-06-10'),
('Imran',   'Anwar',    'Sales',       'Cashier',              28000.00, '2024-06-15'),
('Saima',   'Latif',    'Sales',       'Cashier',              28000.00, '2024-09-01'),
('Rizwan',  'Ghani',    'Warehouse',   'Stock Associate',      30000.00, '2024-09-15'),
('Asma',    'Nasir',    'Sales',       'Sales Associate',      32000.00, '2025-01-10'),
('Junaid',  'Khalid',   'Management',  'Operations Manager',   75000.00, '2020-02-01');


-- ============================================================
-- TABLE 6: customers (60 customers)
-- ============================================================
CREATE TABLE customers (
    customer_id   INT PRIMARY KEY AUTO_INCREMENT,
    first_name    VARCHAR(50),
    last_name     VARCHAR(50),
    city          VARCHAR(50),
    phone         VARCHAR(20),
    email         VARCHAR(100),
    loyalty_tier  ENUM('Bronze','Silver','Gold','Platinum'),
    join_date     DATE
);

INSERT INTO customers (first_name, last_name, city, phone, email, loyalty_tier, join_date) VALUES
('Ali',     'Hassan',   'Lahore',    '0311-1111111', 'ali.hassan@email.com',    'Gold',     '2022-01-15'),
('Amina',   'Khan',     'Karachi',   '0311-2222222', 'amina.khan@email.com',    'Platinum', '2021-06-20'),
('Bilal',   'Ahmed',    'Islamabad', '0311-3333333', 'bilal.ahmed@email.com',   'Silver',   '2023-03-10'),
('Fatima',  'Ali',      'Lahore',    '0311-4444444', 'fatima.ali@email.com',    'Gold',     '2022-08-25'),
('Omar',    'Sheikh',   'Karachi',   '0311-5555555', 'omar.sheikh@email.com',   'Bronze',   '2024-01-05'),
('Sara',    'Malik',    'Multan',    '0311-6666666', 'sara.malik@email.com',    'Silver',   '2023-05-15'),
('Usman',   'Hussain',  'Lahore',    '0311-7777777', 'usman.hussain@email.com', 'Gold',     '2022-11-20'),
('Hina',    'Qureshi',  'Karachi',   '0311-8888888', 'hina.qureshi@email.com',  'Platinum', '2021-09-10'),
('Zain',    'Farooq',   'Islamabad', '0311-9999999', 'zain.farooq@email.com',   'Bronze',   '2024-03-20'),
('Nadia',   'Iqbal',    'Lahore',    '0312-1111111', 'nadia.iqbal@email.com',   'Silver',   '2023-07-15'),
('Tariq',   'Butt',     'Karachi',   '0312-2222222', 'tariq.butt@email.com',    'Gold',     '2022-04-10'),
('Sana',    'Chaudhry', 'Multan',    '0312-3333333', 'sana.chaudhry@email.com', 'Bronze',   '2024-05-20'),
('Hamza',   'Mirza',    'Lahore',    '0312-4444444', 'hamza.mirza@email.com',   'Silver',   '2023-09-05'),
('Rabia',   'Siddiqui', 'Karachi',   '0312-5555555', 'rabia.sid@email.com',     'Gold',     '2022-06-15'),
('Adnan',   'Raza',     'Islamabad', '0312-6666666', 'adnan.raza@email.com',    'Platinum', '2021-12-20'),
('Zara',    'Nawaz',    'Lahore',    '0312-7777777', 'zara.nawaz@email.com',    'Bronze',   '2024-07-10'),
('Faisal',  'Baig',     'Karachi',   '0312-8888888', 'faisal.baig@email.com',   'Silver',   '2023-11-25'),
('Mariam',  'Javed',    'Multan',    '0312-9999999', 'mariam.javed@email.com',  'Gold',     '2022-02-15'),
('Kamran',  'Ashraf',   'Lahore',    '0313-1111111', 'kamran.ashraf@email.com', 'Bronze',   '2024-09-01'),
('Lubna',   'Zahid',    'Karachi',   '0313-2222222', 'lubna.zahid@email.com',   'Silver',   '2023-01-20'),
('Imran',   'Anwar',    'Islamabad', '0313-3333333', 'imran.anwar@email.com',   'Gold',     '2022-05-10'),
('Saima',   'Latif',    'Lahore',    '0313-4444444', 'saima.latif@email.com',   'Platinum', '2021-08-15'),
('Rizwan',  'Ghani',    'Karachi',   '0313-5555555', 'rizwan.ghani@email.com',  'Bronze',   '2024-11-05'),
('Asma',    'Nasir',    'Multan',    '0313-6666666', 'asma.nasir@email.com',    'Silver',   '2023-04-20'),
('Junaid',  'Khalid',   'Lahore',    '0313-7777777', 'junaid.khalid@email.com', 'Gold',     '2022-09-15'),
('Rida',    'Bashir',   'Karachi',   '0313-8888888', 'rida.bashir@email.com',   'Bronze',   '2025-01-10'),
('Naeem',   'Sultan',   'Islamabad', '0313-9999999', 'naeem.sultan@email.com',  'Silver',   '2023-06-25'),
('Huma',    'Riaz',     'Lahore',    '0314-1111111', 'huma.riaz@email.com',     'Gold',     '2022-03-20'),
('Shoaib',  'Dar',      'Karachi',   '0314-2222222', 'shoaib.dar@email.com',    'Platinum', '2021-11-15'),
('Madiha',  'Awan',     'Multan',    '0314-3333333', 'madiha.awan@email.com',   'Bronze',   '2024-08-10'),
('Waheed',  'Bajwa',    'Lahore',    '0314-4444444', 'waheed.bajwa@email.com',  'Silver',   '2023-02-15'),
('Noor',    'Yusuf',    'Karachi',   '0314-5555555', 'noor.yusuf@email.com',    'Gold',     '2022-07-20'),
('Arif',    'Gul',      'Islamabad', '0314-6666666', 'arif.gul@email.com',      'Bronze',   '2025-02-05'),
('Tahira',  'Niazi',    'Lahore',    '0314-7777777', 'tahira.niazi@email.com',  'Silver',   '2023-08-10'),
('Waqas',   'Cheema',   'Karachi',   '0314-8888888', 'waqas.cheema@email.com',  'Gold',     '2022-10-25'),
('Bushra',  'Toor',     'Multan',    '0314-9999999', 'bushra.toor@email.com',   'Platinum', '2021-07-20'),
('Shahid',  'Gill',     'Lahore',    '0315-1111111', 'shahid.gill@email.com',   'Bronze',   '2024-10-15'),
('Uzma',    'Bokhari',  'Karachi',   '0315-2222222', 'uzma.bokhari@email.com',  'Silver',   '2023-12-20'),
('Nasir',   'Gondal',   'Islamabad', '0315-3333333', 'nasir.gondal@email.com',  'Gold',     '2022-12-10'),
('Shazia',  'Noon',     'Lahore',    '0315-4444444', 'shazia.noon@email.com',   'Bronze',   '2025-03-05'),
('Pervez',  'Lodi',     'Karachi',   '0315-5555555', 'pervez.lodi@email.com',   'Silver',   '2024-02-15'),
('Rubina',  'Sial',     'Multan',    '0315-6666666', 'rubina.sial@email.com',   'Gold',     '2023-10-20'),
('Ejaz',    'Warraich', 'Lahore',    '0315-7777777', 'ejaz.warraich@email.com', 'Platinum', '2021-05-10'),
('Fozia',   'Rajput',   'Karachi',   '0315-8888888', 'fozia.rajput@email.com',  'Bronze',   '2025-04-01'),
('Tanveer', 'Bhatti',   'Islamabad', '0315-9999999', 'tanveer.bhatti@email.com','Silver',   '2024-04-15'),
('Shabana', 'Dogar',    'Lahore',    '0316-1111111', 'shabana.dogar@email.com', 'Gold',     '2023-11-10'),
('Naveed',  'Virk',     'Karachi',   '0316-2222222', 'naveed.virk@email.com',   'Bronze',   '2025-05-01'),
('Samina',  'Chatha',   'Multan',    '0316-3333333', 'samina.chatha@email.com', 'Silver',   '2024-06-20'),
('Rashid',  'Randhawa', 'Lahore',    '0316-4444444', 'rashid.randhawa@email.com','Gold',    '2023-12-15'),
('Gulshan', 'Sipra',    'Karachi',   '0316-5555555', 'gulshan.sipra@email.com', 'Platinum', '2021-04-10');


-- ============================================================
-- TABLE 7: orders
-- ============================================================
CREATE TABLE orders (
    order_id      INT PRIMARY KEY AUTO_INCREMENT,
    customer_id   INT,
    employee_id   INT,
    order_date    DATE,
    total_amount  DECIMAL(10,2),
    status        ENUM('Completed','Pending','Cancelled'),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO orders (customer_id, employee_id, order_date, total_amount, status) VALUES
(1,6,'2025-01-05',1250.00,'Completed'),(2,8,'2025-01-06',3800.00,'Completed'),
(3,12,'2025-01-07',650.00,'Completed'),(4,6,'2025-01-08',2100.00,'Completed'),
(5,16,'2025-01-09',480.00,'Pending'),(6,8,'2025-01-10',1750.00,'Completed'),
(7,12,'2025-01-11',3200.00,'Completed'),(8,6,'2025-01-12',5500.00,'Completed'),
(9,16,'2025-01-13',320.00,'Cancelled'),(10,8,'2025-01-14',1800.00,'Completed'),
(11,12,'2025-01-15',2400.00,'Completed'),(12,6,'2025-01-16',750.00,'Completed'),
(13,16,'2025-01-17',1100.00,'Completed'),(14,8,'2025-01-18',4200.00,'Completed'),
(15,12,'2025-01-19',6800.00,'Completed'),(16,6,'2025-01-20',450.00,'Pending'),
(17,16,'2025-01-21',1950.00,'Completed'),(18,8,'2025-01-22',2800.00,'Completed'),
(19,12,'2025-01-23',380.00,'Cancelled'),(20,6,'2025-01-24',1600.00,'Completed'),
(21,16,'2025-02-01',2200.00,'Completed'),(22,8,'2025-02-02',7500.00,'Completed'),
(23,12,'2025-02-03',550.00,'Completed'),(24,6,'2025-02-04',1800.00,'Completed'),
(25,16,'2025-02-05',420.00,'Pending'),(26,8,'2025-02-06',2100.00,'Completed'),
(27,12,'2025-02-07',3400.00,'Completed'),(28,6,'2025-02-08',4800.00,'Completed'),
(29,16,'2025-02-09',280.00,'Cancelled'),(30,8,'2025-02-10',1500.00,'Completed'),
(31,12,'2025-02-11',2600.00,'Completed'),(32,6,'2025-02-12',680.00,'Completed'),
(33,16,'2025-02-13',1200.00,'Completed'),(34,8,'2025-02-14',5200.00,'Completed'),
(35,12,'2025-02-15',3800.00,'Completed'),(36,6,'2025-02-16',480.00,'Pending'),
(37,16,'2025-02-17',2100.00,'Completed'),(38,8,'2025-02-18',3200.00,'Completed'),
(39,12,'2025-02-19',420.00,'Cancelled'),(40,6,'2025-02-20',1750.00,'Completed'),
(1,16,'2025-03-01',1800.00,'Completed'),(2,8,'2025-03-02',4200.00,'Completed'),
(3,12,'2025-03-03',720.00,'Completed'),(4,6,'2025-03-04',2400.00,'Completed'),
(5,16,'2025-03-05',560.00,'Completed'),(6,8,'2025-03-06',1900.00,'Completed'),
(7,12,'2025-03-07',3600.00,'Completed'),(8,6,'2025-03-08',6200.00,'Completed'),
(9,16,'2025-03-09',340.00,'Cancelled'),(10,8,'2025-03-10',2000.00,'Completed'),
(41,12,'2025-03-11',2800.00,'Completed'),(42,6,'2025-03-12',820.00,'Completed'),
(43,16,'2025-03-13',1400.00,'Completed'),(44,8,'2025-03-14',4600.00,'Completed'),
(45,12,'2025-03-15',7200.00,'Completed'),(46,6,'2025-03-16',520.00,'Pending'),
(47,16,'2025-03-17',2200.00,'Completed'),(48,8,'2025-03-18',3100.00,'Completed'),
(49,12,'2025-03-19',460.00,'Cancelled'),(50,6,'2025-03-20',1850.00,'Completed'),
(1,16,'2025-04-01',2100.00,'Completed'),(2,8,'2025-04-02',5800.00,'Completed'),
(11,12,'2025-04-03',780.00,'Completed'),(12,6,'2025-04-04',2600.00,'Completed'),
(13,16,'2025-04-05',620.00,'Completed'),(14,8,'2025-04-06',2050.00,'Completed'),
(15,12,'2025-04-07',3900.00,'Completed'),(16,6,'2025-04-08',6800.00,'Completed'),
(17,16,'2025-04-09',380.00,'Cancelled'),(18,8,'2025-04-10',2200.00,'Completed'),
(19,12,'2025-04-11',3000.00,'Completed'),(20,6,'2025-04-12',900.00,'Completed'),
(21,16,'2025-04-13',1600.00,'Completed'),(22,8,'2025-04-14',4800.00,'Completed'),
(23,12,'2025-04-15',8200.00,'Completed'),(24,6,'2025-04-16',580.00,'Pending'),
(25,16,'2025-04-17',2400.00,'Completed'),(26,8,'2025-04-18',3400.00,'Completed'),
(27,12,'2025-04-19',500.00,'Cancelled'),(28,6,'2025-04-20',2000.00,'Completed');


-- ============================================================
-- TABLE 8: order_items
-- ============================================================
CREATE TABLE order_items (
    item_id     INT PRIMARY KEY AUTO_INCREMENT,
    order_id    INT,
    product_id  INT,
    quantity    INT,
    unit_price  DECIMAL(8,2),
    FOREIGN KEY (order_id)   REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1,1,5,25.00),(1,9,2,180.00),(1,17,3,90.00),
(2,41,2,550.00),(2,43,3,480.00),(2,67,2,25.00),
(3,25,4,70.00),(3,27,2,95.00),(3,31,1,60.00),
(4,9,3,180.00),(4,13,2,250.00),(4,15,1,320.00),
(5,33,4,80.00),(5,36,3,60.00),(5,37,2,50.00),
(6,59,1,220.00),(6,61,2,350.00),(6,64,3,200.00),
(7,41,3,550.00),(7,44,2,650.00),(7,46,1,320.00),
(8,67,2,25.00),(8,68,3,20.00),(8,72,1,15.00),
(9,79,2,350.00),(9,80,1,480.00),
(10,9,4,180.00),(10,11,3,120.00),(10,16,2,150.00),
(11,17,5,90.00),(11,18,3,110.00),(11,20,2,120.00),
(12,25,5,70.00),(12,26,3,70.00),(12,31,2,60.00),
(13,33,3,80.00),(13,35,4,120.00),(13,38,2,40.00),
(14,41,4,550.00),(14,45,2,750.00),(14,48,3,520.00),
(15,67,3,25.00),(15,68,4,20.00),(15,69,2,80.00),(15,72,1,15.00),
(16,85,2,90.00),(16,86,1,100.00),(16,87,1,80.00),
(17,9,3,180.00),(17,14,1,480.00),(17,15,2,320.00),
(18,17,4,90.00),(18,21,3,130.00),(18,24,2,70.00),
(19,79,1,350.00),(19,80,1,480.00),
(20,59,2,220.00),(20,60,2,150.00),(20,61,1,350.00),
(21,41,2,550.00),(21,42,3,420.00),(21,46,2,320.00),
(22,67,4,25.00),(22,68,5,20.00),(22,71,2,50.00),(22,72,2,15.00),
(23,25,4,70.00),(23,29,2,150.00),(23,30,1,140.00),
(24,9,4,180.00),(24,11,3,120.00),(24,15,1,320.00),
(25,33,3,80.00),(25,37,4,50.00),(25,38,2,40.00),
(26,17,5,90.00),(26,20,3,120.00),(26,22,2,80.00),
(27,41,3,550.00),(27,44,2,650.00),(27,47,2,580.00),
(28,67,5,25.00),(28,69,3,80.00),(28,70,2,60.00),(28,72,3,15.00),
(29,79,1,350.00),(29,83,1,420.00),
(30,9,3,180.00),(30,13,2,250.00),(30,16,1,150.00),
(31,17,4,90.00),(31,18,3,110.00),(31,19,3,60.00),
(32,25,5,70.00),(32,27,3,95.00),(32,31,2,60.00),
(33,33,4,80.00),(33,34,3,150.00),(33,40,2,65.00),
(34,41,5,550.00),(34,43,3,480.00),(34,48,2,520.00),
(35,67,3,25.00),(35,68,4,20.00),(35,73,2,180.00),(35,74,1,160.00),
(36,85,2,90.00),(36,88,2,70.00),(36,89,1,60.00),
(37,9,4,180.00),(37,14,2,480.00),(37,15,1,320.00),
(38,17,5,90.00),(38,21,3,130.00),(38,23,2,80.00),
(39,79,1,350.00),(39,81,1,200.00),
(40,59,2,220.00),(40,62,3,90.00),(40,66,2,110.00);


-- ============================================================
-- TABLE 9: stock_movements (500 movements)
-- ============================================================
CREATE TABLE stock_movements (
    movement_id   INT PRIMARY KEY AUTO_INCREMENT,
    product_id    INT,
    movement_type ENUM('IN','OUT'),
    quantity      INT,
    movement_date DATE,
    employee_id   INT,
    notes         VARCHAR(100),
    FOREIGN KEY (product_id)  REFERENCES products(product_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO stock_movements (product_id, movement_type, quantity, movement_date, employee_id, notes) VALUES
(1,'IN',200,'2025-01-02',5,'Delivery'),(1,'OUT',80,'2025-01-10',7,'Sold'),
(1,'OUT',60,'2025-01-18',9,'Sold'),(1,'IN',150,'2025-02-03',5,'Delivery'),
(1,'OUT',70,'2025-02-15',13,'Sold'),(1,'IN',100,'2025-03-05',5,'Delivery'),
(1,'OUT',50,'2025-03-20',17,'Sold'),(2,'IN',100,'2025-01-03',5,'Delivery'),
(2,'OUT',45,'2025-01-12',7,'Sold'),(2,'IN',80,'2025-02-04',5,'Delivery'),
(2,'OUT',55,'2025-02-18',9,'Sold'),(2,'IN',60,'2025-03-06',5,'Delivery'),
(2,'OUT',35,'2025-03-22',13,'Sold'),(3,'IN',100,'2025-01-04',5,'Delivery'),
(3,'OUT',50,'2025-01-15',7,'Sold'),(3,'IN',80,'2025-02-05',5,'Delivery'),
(3,'OUT',60,'2025-02-20',9,'Sold'),(4,'IN',120,'2025-01-05',5,'Delivery'),
(4,'OUT',55,'2025-01-16',7,'Sold'),(4,'IN',80,'2025-02-06',5,'Delivery'),
(4,'OUT',45,'2025-02-22',13,'Sold'),(5,'IN',80,'2025-01-06',5,'Delivery'),
(5,'OUT',35,'2025-01-18',9,'Sold'),(5,'IN',60,'2025-02-07',5,'Delivery'),
(5,'OUT',40,'2025-02-25',17,'Sold'),(6,'IN',150,'2025-01-07',5,'Delivery'),
(6,'OUT',70,'2025-01-20',7,'Sold'),(6,'IN',100,'2025-02-08',5,'Delivery'),
(6,'OUT',60,'2025-03-01',9,'Sold'),(7,'IN',50,'2025-01-08',5,'Delivery'),
(7,'OUT',20,'2025-01-22',13,'Sold'),(7,'IN',40,'2025-02-09',5,'Delivery'),
(7,'OUT',25,'2025-03-02',17,'Sold'),(8,'IN',120,'2025-01-09',5,'Delivery'),
(8,'OUT',55,'2025-01-24',7,'Sold'),(8,'IN',80,'2025-02-10',5,'Delivery'),
(8,'OUT',50,'2025-03-05',9,'Sold'),(9,'IN',150,'2025-01-03',5,'Delivery'),
(9,'OUT',70,'2025-01-13',7,'Sold'),(9,'OUT',50,'2025-01-25',13,'Sold'),
(9,'IN',120,'2025-02-04',5,'Delivery'),(9,'OUT',65,'2025-02-18',17,'Sold'),
(9,'IN',100,'2025-03-06',5,'Delivery'),(9,'OUT',55,'2025-03-22',9,'Sold'),
(10,'IN',140,'2025-01-04',5,'Delivery'),(10,'OUT',65,'2025-01-14',7,'Sold'),
(10,'IN',100,'2025-02-05',5,'Delivery'),(10,'OUT',70,'2025-02-20',13,'Sold'),
(11,'IN',80,'2025-01-05',5,'Delivery'),(11,'OUT',35,'2025-01-16',9,'Sold'),
(11,'IN',60,'2025-02-06',5,'Delivery'),(11,'OUT',40,'2025-02-22',17,'Sold'),
(12,'IN',100,'2025-01-06',5,'Delivery'),(12,'OUT',45,'2025-01-18',7,'Sold'),
(12,'IN',80,'2025-02-07',5,'Delivery'),(12,'OUT',55,'2025-03-01',9,'Sold'),
(13,'IN',50,'2025-01-07',5,'Delivery'),(13,'OUT',20,'2025-01-20',13,'Sold'),
(13,'IN',40,'2025-02-08',5,'Delivery'),(13,'OUT',25,'2025-03-02',17,'Sold'),
(14,'IN',40,'2025-01-08',5,'Delivery'),(14,'OUT',15,'2025-01-22',7,'Sold'),
(14,'IN',30,'2025-02-09',5,'Delivery'),(14,'OUT',20,'2025-03-05',9,'Sold'),
(15,'IN',60,'2025-01-09',5,'Delivery'),(15,'OUT',25,'2025-01-24',13,'Sold'),
(15,'IN',50,'2025-02-10',5,'Delivery'),(15,'OUT',35,'2025-03-08',17,'Sold'),
(16,'IN',80,'2025-01-10',5,'Delivery'),(16,'OUT',35,'2025-01-26',7,'Sold'),
(16,'IN',60,'2025-02-11',5,'Delivery'),(16,'OUT',40,'2025-03-10',9,'Sold'),
(17,'IN',120,'2025-01-04',5,'Delivery'),(17,'OUT',55,'2025-01-15',13,'Sold'),
(17,'OUT',40,'2025-01-28',17,'Sold'),(17,'IN',100,'2025-02-05',5,'Delivery'),
(17,'OUT',60,'2025-02-20',7,'Sold'),(17,'IN',80,'2025-03-07',5,'Delivery'),
(17,'OUT',45,'2025-03-25',9,'Sold'),(18,'IN',100,'2025-01-05',5,'Delivery'),
(18,'OUT',50,'2025-01-16',13,'Sold'),(18,'IN',80,'2025-02-06',5,'Delivery'),
(18,'OUT',55,'2025-02-22',17,'Sold'),(19,'IN',60,'2025-01-06',5,'Delivery'),
(19,'OUT',25,'2025-01-18',7,'Sold'),(19,'IN',50,'2025-02-07',5,'Delivery'),
(19,'OUT',30,'2025-03-01',9,'Sold'),(20,'IN',80,'2025-01-07',5,'Delivery'),
(20,'OUT',35,'2025-01-20',13,'Sold'),(20,'IN',60,'2025-02-08',5,'Delivery'),
(20,'OUT',40,'2025-03-02',17,'Sold'),(21,'IN',70,'2025-01-08',5,'Delivery'),
(21,'OUT',30,'2025-01-22',7,'Sold'),(21,'IN',50,'2025-02-09',5,'Delivery'),
(21,'OUT',35,'2025-03-05',9,'Sold'),(22,'IN',50,'2025-01-09',5,'Delivery'),
(22,'OUT',20,'2025-01-24',13,'Sold'),(22,'IN',40,'2025-02-10',5,'Delivery'),
(22,'OUT',25,'2025-03-08',17,'Sold'),(23,'IN',60,'2025-01-10',5,'Delivery'),
(23,'OUT',25,'2025-01-26',7,'Sold'),(23,'IN',50,'2025-02-11',5,'Delivery'),
(23,'OUT',30,'2025-03-10',9,'Sold'),(24,'IN',70,'2025-01-11',5,'Delivery'),
(24,'OUT',30,'2025-01-28',13,'Sold'),(24,'IN',55,'2025-02-12',5,'Delivery'),
(24,'OUT',35,'2025-03-12',17,'Sold'),(25,'IN',200,'2025-01-05',5,'Delivery'),
(25,'OUT',95,'2025-01-16',7,'Sold'),(25,'OUT',70,'2025-01-28',9,'Sold'),
(25,'IN',150,'2025-02-06',5,'Delivery'),(25,'OUT',85,'2025-02-20',13,'Sold'),
(25,'IN',120,'2025-03-08',5,'Delivery'),(25,'OUT',65,'2025-03-25',17,'Sold'),
(26,'IN',180,'2025-01-06',5,'Delivery'),(26,'OUT',85,'2025-01-17',7,'Sold'),
(26,'IN',140,'2025-02-07',5,'Delivery'),(26,'OUT',90,'2025-02-22',9,'Sold'),
(27,'IN',120,'2025-01-07',5,'Delivery'),(27,'OUT',55,'2025-01-18',13,'Sold'),
(27,'IN',90,'2025-02-08',5,'Delivery'),(27,'OUT',60,'2025-03-01',17,'Sold'),
(28,'IN',100,'2025-01-08',5,'Delivery'),(28,'OUT',45,'2025-01-20',7,'Sold'),
(28,'IN',80,'2025-02-09',5,'Delivery'),(28,'OUT',55,'2025-03-02',9,'Sold'),
(29,'IN',90,'2025-01-09',5,'Delivery'),(29,'OUT',40,'2025-01-22',13,'Sold'),
(29,'IN',70,'2025-02-10',5,'Delivery'),(29,'OUT',45,'2025-03-05',17,'Sold'),
(30,'IN',90,'2025-01-10',5,'Delivery'),(30,'OUT',40,'2025-01-24',7,'Sold'),
(30,'IN',70,'2025-02-11',5,'Delivery'),(30,'OUT',45,'2025-03-08',9,'Sold'),
(31,'IN',100,'2025-01-11',5,'Delivery'),(31,'OUT',45,'2025-01-26',13,'Sold'),
(31,'IN',80,'2025-02-12',5,'Delivery'),(31,'OUT',50,'2025-03-10',17,'Sold'),
(32,'IN',80,'2025-01-12',5,'Delivery'),(32,'OUT',35,'2025-01-28',7,'Sold'),
(32,'IN',65,'2025-02-13',5,'Delivery'),(32,'OUT',40,'2025-03-12',9,'Sold'),
(33,'IN',150,'2025-01-06',5,'Delivery'),(33,'OUT',70,'2025-01-17',13,'Sold'),
(33,'OUT',50,'2025-01-29',17,'Sold'),(33,'IN',120,'2025-02-07',5,'Delivery'),
(33,'OUT',65,'2025-02-22',7,'Sold'),(33,'IN',100,'2025-03-09',5,'Delivery'),
(33,'OUT',55,'2025-03-26',9,'Sold'),(34,'IN',130,'2025-01-07',5,'Delivery'),
(34,'OUT',60,'2025-01-18',13,'Sold'),(34,'IN',100,'2025-02-08',5,'Delivery'),
(34,'OUT',65,'2025-02-24',17,'Sold'),(35,'IN',140,'2025-01-08',5,'Delivery'),
(35,'OUT',65,'2025-01-20',7,'Sold'),(35,'IN',110,'2025-02-09',5,'Delivery'),
(35,'OUT',70,'2025-03-01',9,'Sold'),(36,'IN',200,'2025-01-09',5,'Delivery'),
(36,'OUT',90,'2025-01-22',13,'Sold'),(36,'IN',150,'2025-02-10',5,'Delivery'),
(36,'OUT',95,'2025-03-02',17,'Sold'),(37,'IN',200,'2025-01-10',5,'Delivery'),
(37,'OUT',90,'2025-01-24',7,'Sold'),(37,'IN',160,'2025-02-11',5,'Delivery'),
(37,'OUT',100,'2025-03-05',9,'Sold'),(38,'IN',200,'2025-01-11',5,'Delivery'),
(38,'OUT',90,'2025-01-26',13,'Sold'),(38,'IN',160,'2025-02-12',5,'Delivery'),
(38,'OUT',100,'2025-03-08',17,'Sold'),(39,'IN',100,'2025-01-12',5,'Delivery'),
(39,'OUT',45,'2025-01-28',7,'Sold'),(39,'IN',80,'2025-02-13',5,'Delivery'),
(39,'OUT',50,'2025-03-10',9,'Sold'),(40,'IN',160,'2025-01-13',5,'Delivery'),
(40,'OUT',75,'2025-01-29',13,'Sold'),(40,'IN',130,'2025-02-14',5,'Delivery'),
(40,'OUT',80,'2025-03-12',17,'Sold'),(41,'IN',40,'2025-01-07',5,'Delivery'),
(41,'OUT',15,'2025-01-18',7,'Sold'),(41,'IN',35,'2025-02-08',5,'Delivery'),
(41,'OUT',20,'2025-02-22',9,'Sold'),(41,'IN',30,'2025-03-10',5,'Delivery'),
(41,'OUT',18,'2025-03-28',13,'Sold'),(42,'IN',50,'2025-01-08',5,'Delivery'),
(42,'OUT',20,'2025-01-20',17,'Sold'),(42,'IN',40,'2025-02-09',5,'Delivery'),
(42,'OUT',25,'2025-03-01',7,'Sold'),(43,'IN',30,'2025-01-09',5,'Delivery'),
(43,'OUT',12,'2025-01-22',9,'Sold'),(43,'IN',25,'2025-02-10',5,'Delivery'),
(43,'OUT',15,'2025-03-02',13,'Sold'),(44,'IN',20,'2025-01-10',5,'Delivery'),
(44,'OUT',8,'2025-01-24',17,'Sold'),(44,'IN',18,'2025-02-11',5,'Delivery'),
(44,'OUT',10,'2025-03-05',7,'Sold'),(45,'IN',18,'2025-01-11',5,'Delivery'),
(45,'OUT',7,'2025-01-26',9,'Sold'),(45,'IN',15,'2025-02-12',5,'Delivery'),
(45,'OUT',9,'2025-03-08',13,'Sold'),(46,'IN',50,'2025-01-12',5,'Delivery'),
(46,'OUT',22,'2025-01-28',17,'Sold'),(46,'IN',40,'2025-02-13',5,'Delivery'),
(46,'OUT',28,'2025-03-10',7,'Sold'),(47,'IN',25,'2025-01-13',5,'Delivery'),
(47,'OUT',10,'2025-01-29',9,'Sold'),(47,'IN',20,'2025-02-14',5,'Delivery'),
(47,'OUT',12,'2025-03-12',13,'Sold'),(48,'IN',30,'2025-01-14',5,'Delivery'),
(48,'OUT',12,'2025-01-30',17,'Sold'),(48,'IN',25,'2025-02-15',5,'Delivery'),
(48,'OUT',15,'2025-03-14',7,'Sold'),(49,'IN',20,'2025-01-08',5,'Delivery'),
(49,'OUT',8,'2025-01-20',9,'Sold'),(49,'IN',18,'2025-02-09',5,'Delivery'),
(49,'OUT',10,'2025-03-01',13,'Sold'),(50,'IN',25,'2025-01-09',5,'Delivery'),
(50,'OUT',10,'2025-01-22',17,'Sold'),(50,'IN',20,'2025-02-10',5,'Delivery'),
(50,'OUT',12,'2025-03-02',7,'Sold'),(51,'IN',18,'2025-01-10',5,'Delivery'),
(51,'OUT',7,'2025-01-24',9,'Sold'),(51,'IN',15,'2025-02-11',5,'Delivery'),
(51,'OUT',9,'2025-03-05',13,'Sold'),(52,'IN',12,'2025-01-11',5,'Delivery'),
(52,'OUT',5,'2025-01-26',17,'Sold'),(52,'IN',10,'2025-02-12',5,'Delivery'),
(52,'OUT',6,'2025-03-08',7,'Sold'),(53,'IN',80,'2025-01-12',5,'Delivery'),
(53,'OUT',35,'2025-01-28',9,'Sold'),(53,'IN',65,'2025-02-13',5,'Delivery'),
(53,'OUT',40,'2025-03-10',13,'Sold'),(54,'IN',85,'2025-01-13',5,'Delivery'),
(54,'OUT',38,'2025-01-29',17,'Sold'),(54,'IN',70,'2025-02-14',5,'Delivery'),
(54,'OUT',42,'2025-03-12',7,'Sold'),(55,'IN',25,'2025-01-14',5,'Delivery'),
(55,'OUT',10,'2025-01-30',9,'Sold'),(55,'IN',20,'2025-02-15',5,'Delivery'),
(55,'OUT',12,'2025-03-14',13,'Sold'),(56,'IN',22,'2025-01-15',5,'Delivery'),
(56,'OUT',9,'2025-02-01',17,'Sold'),(56,'IN',18,'2025-02-16',5,'Delivery'),
(56,'OUT',11,'2025-03-16',7,'Sold'),(57,'IN',28,'2025-01-16',5,'Delivery'),
(57,'OUT',11,'2025-02-02',9,'Sold'),(57,'IN',22,'2025-02-17',5,'Delivery'),
(57,'OUT',14,'2025-03-18',13,'Sold'),(58,'IN',30,'2025-01-17',5,'Delivery'),
(58,'OUT',12,'2025-02-03',17,'Sold'),(58,'IN',25,'2025-02-18',5,'Delivery'),
(58,'OUT',15,'2025-03-20',7,'Sold'),(59,'IN',70,'2025-01-18',5,'Delivery'),
(59,'OUT',30,'2025-02-04',9,'Sold'),(59,'IN',55,'2025-02-19',5,'Delivery'),
(59,'OUT',35,'2025-03-22',13,'Sold'),(60,'IN',80,'2025-01-19',5,'Delivery'),
(60,'OUT',35,'2025-02-05',17,'Sold'),(60,'IN',65,'2025-02-20',5,'Delivery'),
(60,'OUT',40,'2025-03-24',7,'Sold'),(61,'IN',60,'2025-01-20',5,'Delivery'),
(61,'OUT',25,'2025-02-06',9,'Sold'),(61,'IN',50,'2025-02-21',5,'Delivery'),
(61,'OUT',30,'2025-03-26',13,'Sold'),(62,'IN',55,'2025-01-21',5,'Delivery'),
(62,'OUT',22,'2025-02-07',17,'Sold'),(62,'IN',45,'2025-02-22',5,'Delivery'),
(62,'OUT',28,'2025-03-28',7,'Sold'),(63,'IN',50,'2025-01-22',5,'Delivery'),
(63,'OUT',20,'2025-02-08',9,'Sold'),(63,'IN',40,'2025-02-23',5,'Delivery'),
(63,'OUT',25,'2025-04-01',13,'Sold'),(64,'IN',120,'2025-01-23',5,'Delivery'),
(64,'OUT',55,'2025-02-09',17,'Sold'),(64,'IN',100,'2025-02-24',5,'Delivery'),
(64,'OUT',60,'2025-04-02',7,'Sold'),(65,'IN',80,'2025-01-24',5,'Delivery'),
(65,'OUT',35,'2025-02-10',9,'Sold'),(65,'IN',65,'2025-02-25',5,'Delivery'),
(65,'OUT',40,'2025-04-03',13,'Sold'),(66,'IN',65,'2025-01-25',5,'Delivery'),
(66,'OUT',28,'2025-02-11',17,'Sold'),(66,'IN',55,'2025-02-26',5,'Delivery'),
(66,'OUT',32,'2025-04-04',7,'Sold'),(67,'IN',15,'2025-01-26',5,'Delivery'),
(67,'OUT',6,'2025-02-12',9,'Sold'),(67,'IN',12,'2025-02-27',5,'Delivery'),
(67,'OUT',7,'2025-04-05',13,'Sold'),(68,'IN',12,'2025-01-27',5,'Delivery'),
(68,'OUT',5,'2025-02-13',17,'Sold'),(68,'IN',10,'2025-02-28',5,'Delivery'),
(68,'OUT',6,'2025-04-06',7,'Sold'),(69,'IN',50,'2025-01-28',5,'Delivery'),
(69,'OUT',22,'2025-02-14',9,'Sold'),(69,'IN',40,'2025-03-01',5,'Delivery'),
(69,'OUT',25,'2025-04-07',13,'Sold'),(70,'IN',40,'2025-01-29',5,'Delivery'),
(70,'OUT',18,'2025-02-15',17,'Sold'),(70,'IN',32,'2025-03-02',5,'Delivery'),
(70,'OUT',20,'2025-04-08',7,'Sold'),(71,'IN',30,'2025-01-30',5,'Delivery'),
(71,'OUT',12,'2025-02-16',9,'Sold'),(71,'IN',25,'2025-03-03',5,'Delivery'),
(71,'OUT',15,'2025-04-09',13,'Sold'),(72,'IN',10,'2025-01-31',5,'Delivery'),
(72,'OUT',4,'2025-02-17',17,'Sold'),(72,'IN',8,'2025-03-04',5,'Delivery'),
(72,'OUT',5,'2025-04-10',7,'Sold'),(73,'IN',100,'2025-02-01',5,'Delivery'),
(73,'OUT',45,'2025-02-18',9,'Sold'),(73,'IN',80,'2025-03-05',5,'Delivery'),
(73,'OUT',50,'2025-04-11',13,'Sold'),(74,'IN',90,'2025-02-02',5,'Delivery'),
(74,'OUT',40,'2025-02-19',17,'Sold'),(74,'IN',75,'2025-03-06',5,'Delivery'),
(74,'OUT',45,'2025-04-12',7,'Sold'),(75,'IN',110,'2025-02-03',5,'Delivery'),
(75,'OUT',50,'2025-02-20',9,'Sold'),(75,'IN',90,'2025-03-07',5,'Delivery'),
(75,'OUT',55,'2025-04-13',13,'Sold'),(76,'IN',120,'2025-02-04',5,'Delivery'),
(76,'OUT',55,'2025-02-21',17,'Sold'),(76,'IN',100,'2025-03-08',5,'Delivery'),
(76,'OUT',60,'2025-04-14',7,'Sold'),(77,'IN',80,'2025-02-05',5,'Delivery'),
(77,'OUT',35,'2025-02-22',9,'Sold'),(77,'IN',65,'2025-03-09',5,'Delivery'),
(77,'OUT',40,'2025-04-15',13,'Sold'),(78,'IN',70,'2025-02-06',5,'Delivery'),
(78,'OUT',30,'2025-02-23',17,'Sold'),(78,'IN',58,'2025-03-10',5,'Delivery'),
(78,'OUT',35,'2025-04-16',7,'Sold'),(79,'IN',200,'2025-02-07',5,'Delivery'),
(79,'OUT',90,'2025-02-24',9,'Sold'),(79,'IN',160,'2025-03-11',5,'Delivery'),
(79,'OUT',100,'2025-04-17',13,'Sold'),(80,'IN',160,'2025-02-08',5,'Delivery'),
(80,'OUT',72,'2025-02-25',17,'Sold'),(80,'IN',130,'2025-03-12',5,'Delivery'),
(80,'OUT',80,'2025-04-18',7,'Sold'),(81,'IN',120,'2025-02-09',5,'Delivery'),
(81,'OUT',55,'2025-02-26',9,'Sold'),(81,'IN',100,'2025-03-13',5,'Delivery'),
(81,'OUT',60,'2025-04-19',13,'Sold'),(82,'IN',110,'2025-02-10',5,'Delivery'),
(82,'OUT',50,'2025-02-27',17,'Sold'),(82,'IN',90,'2025-03-14',5,'Delivery'),
(82,'OUT',55,'2025-04-20',7,'Sold'),(83,'IN',90,'2025-02-11',5,'Delivery'),
(83,'OUT',40,'2025-02-28',9,'Sold'),(83,'IN',75,'2025-03-15',5,'Delivery'),
(83,'OUT',45,'2025-04-21',13,'Sold'),(84,'IN',75,'2025-02-12',5,'Delivery'),
(84,'OUT',33,'2025-03-01',17,'Sold'),(84,'IN',62,'2025-03-16',5,'Delivery'),
(84,'OUT',38,'2025-04-22',7,'Sold'),(85,'IN',55,'2025-02-13',5,'Delivery'),
(85,'OUT',24,'2025-03-02',9,'Sold'),(85,'IN',45,'2025-03-17',5,'Delivery'),
(85,'OUT',28,'2025-04-23',13,'Sold'),(86,'IN',60,'2025-02-14',5,'Delivery'),
(86,'OUT',26,'2025-03-03',17,'Sold'),(86,'IN',50,'2025-03-18',5,'Delivery'),
(86,'OUT',30,'2025-04-24',7,'Sold'),(87,'IN',50,'2025-02-15',5,'Delivery'),
(87,'OUT',22,'2025-03-04',9,'Sold'),(87,'IN',42,'2025-03-19',5,'Delivery'),
(87,'OUT',26,'2025-04-25',13,'Sold'),(88,'IN',45,'2025-02-16',5,'Delivery'),
(88,'OUT',20,'2025-03-05',17,'Sold'),(88,'IN',38,'2025-03-20',5,'Delivery'),
(88,'OUT',23,'2025-04-26',7,'Sold'),(89,'IN',40,'2025-02-17',5,'Delivery'),
(89,'OUT',18,'2025-03-06',9,'Sold'),(89,'IN',33,'2025-03-21',5,'Delivery'),
(89,'OUT',20,'2025-04-27',13,'Sold'),(90,'IN',28,'2025-02-18',5,'Delivery'),
(90,'OUT',12,'2025-03-07',17,'Sold'),(90,'IN',23,'2025-03-22',5,'Delivery'),
(90,'OUT',14,'2025-04-28',7,'Sold'),(91,'IN',180,'2025-02-19',5,'Delivery'),
(91,'OUT',80,'2025-03-08',9,'Sold'),(91,'IN',150,'2025-03-23',5,'Delivery'),
(91,'OUT',90,'2025-04-29',13,'Sold'),(92,'IN',170,'2025-02-20',5,'Delivery'),
(92,'OUT',75,'2025-03-09',17,'Sold'),(92,'IN',140,'2025-03-24',5,'Delivery'),
(92,'OUT',85,'2025-04-30',7,'Sold'),(93,'IN',150,'2025-02-21',5,'Delivery'),
(93,'OUT',68,'2025-03-10',9,'Sold'),(93,'IN',125,'2025-03-25',5,'Delivery'),
(93,'OUT',75,'2025-05-01',13,'Sold'),(94,'IN',110,'2025-02-22',5,'Delivery'),
(94,'OUT',50,'2025-03-11',17,'Sold'),(94,'IN',90,'2025-03-26',5,'Delivery'),
(94,'OUT',55,'2025-05-02',7,'Sold'),(95,'IN',90,'2025-02-23',5,'Delivery'),
(95,'OUT',40,'2025-03-12',9,'Sold'),(95,'IN',75,'2025-03-27',5,'Delivery'),
(95,'OUT',45,'2025-05-03',13,'Sold'),(96,'IN',250,'2025-02-24',5,'Delivery'),
(96,'OUT',110,'2025-03-13',17,'Sold'),(96,'IN',200,'2025-03-28',5,'Delivery'),
(96,'OUT',120,'2025-05-04',7,'Sold'),(97,'IN',120,'2025-02-25',5,'Delivery'),
(97,'OUT',55,'2025-03-14',9,'Sold'),(97,'IN',100,'2025-03-29',5,'Delivery'),
(97,'OUT',60,'2025-05-05',13,'Sold'),(98,'IN',110,'2025-02-26',5,'Delivery'),
(98,'OUT',50,'2025-03-15',17,'Sold'),(98,'IN',90,'2025-03-30',5,'Delivery'),
(98,'OUT',55,'2025-05-06',7,'Sold'),(99,'IN',90,'2025-02-27',5,'Delivery'),
(99,'OUT',40,'2025-03-16',9,'Sold'),(99,'IN',75,'2025-04-01',5,'Delivery'),
(99,'OUT',45,'2025-05-07',13,'Sold'),(100,'IN',75,'2025-02-28',5,'Delivery'),
(100,'OUT',33,'2025-03-17',17,'Sold'),(100,'IN',62,'2025-04-02',5,'Delivery'),
(100,'OUT',38,'2025-05-08',7,'Sold');


-- ============================================================
-- VERIFY: Run these to check all tables loaded correctly
-- ============================================================
 SELECT COUNT(*) as products   FROM products;
SELECT COUNT(*) as employees  FROM employees;
SELECT COUNT(*) as customers  FROM customers;
SELECT COUNT(*) as orders     FROM orders; 
SELECT COUNT(*) as movements  FROM stock_movements;
show tables;
select * from orders;
-- "Give me a monthly sales report — total orders, total revenue and average order value for each month"
select sum(total_amount) from orders where status ='completed';


-- "Which department has the highest total salary cost?"
-- "Who are our top 5 customers by total spending?"
-- "Which employee has processed the most orders?"
-- "Show each customer, their total spending, and rank them within their loyalty tier"

