-- Tạo cơ sở dữ liệu với Collation hỗ trợ Tiếng Việt
CREATE DATABASE ASPNET COLLATE Vietnamese_CI_AS;
GO

-- Sử dụng cơ sở dữ liệu vừa tạo
USE ASPNET;
GO

-- Tạo bảng Product
CREATE TABLE Product (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,  -- ID tự tăng
    ProductName NVARCHAR(255) COLLATE Vietnamese_CI_AS NOT NULL,       -- Tên sản phẩm
    ShortDescription NVARCHAR(500) COLLATE Vietnamese_CI_AS,           -- Mô tả ngắn
    FullDescription NVARCHAR(MAX) COLLATE Vietnamese_CI_AS,            -- Mô tả đầy đủ
    ProductImage NVARCHAR(255),               -- Đường dẫn hoặc URL hình ảnh
    Price DECIMAL(18,2) NOT NULL,             -- Giá sản phẩm
    CategoryID INT NOT NULL,                  -- ID danh mục
    BrandID INT NOT NULL,                     -- ID thương hiệu
    CreateAt DATETIME DEFAULT GETDATE(),      -- Thời gian tạo
    CreateBy NVARCHAR(100) COLLATE Vietnamese_CI_AS,                   -- Người tạo
    UpdateAt DATETIME DEFAULT GETDATE(),      -- Thời gian cập nhật
    UpdateBy NVARCHAR(100) COLLATE Vietnamese_CI_AS,                   -- Người cập nhật
    Status BIT DEFAULT 1,                     -- Trạng thái (1 = Hoạt động, 0 = Không hoạt động)
    ShockSale TINYINT DEFAULT 0,              -- Sản phẩm giảm giá sốc (0 = Không, 1 = Đang, 2 = Hết)
    IsRecommended BIT DEFAULT 0               -- Sản phẩm được đề xuất (0 = Không, 1 = Có)
);

-- Thêm dữ liệu vào Product
INSERT INTO Product (
    ProductName, ShortDescription, FullDescription, ProductImage, Price, 
    CategoryID, BrandID, CreateBy, UpdateBy, Status, ShockSale, IsRecommended
)
VALUES
(N'iPhone X', 
 N'Smartphone cao cấp của Apple', 
 N'iPhone 15 Pro với chip A17 Bionic, màn hình 6.1 inch Super Retina XDR và hệ thống camera Pro.', 
 N'x.png', 
 999.99, 
 1, 
 1, 
 N'Admin', 
 N'Admin', 
 1, 
 1, 
 1),

(N'iPhone 11', 
 N'Smartphone cao cấp của Apple', 
 N'iPhone 15 Pro với chip A17 Bionic, màn hình 6.1 inch Super Retina XDR và hệ thống camera Pro.', 
 N'11.png', 
 1199.99, 
 1, 
 2, 
 N'Admin', 
 N'Admin', 
 1, 
 0, 
 1),

(N'iPhone 12', 
 N'Smartphone cao cấp của Apple', 
 N'iPhone 15 Pro với chip A17 Bionic, màn hình 6.1 inch Super Retina XDR và hệ thống camera Pro.', 
 N'12.png', 
 799.99, 
 1, 
 3, 
 N'Admin', 
 N'Admin', 
 1, 
 1, 
 0);

-- Tạo bảng Categories
CREATE TABLE Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY, -- ID tự tăng
    CategoryName NVARCHAR(255) COLLATE Vietnamese_CI_AS NOT NULL, -- Tên danh mục
    Description NVARCHAR(MAX) COLLATE Vietnamese_CI_AS, -- Mô tả danh mục
    CreateAt DATETIME DEFAULT GETDATE(), -- Thời gian tạo
    CreateBy NVARCHAR(100) COLLATE Vietnamese_CI_AS, -- Người tạo
    UpdateAt DATETIME DEFAULT GETDATE(), -- Thời gian cập nhật
    UpdateBy NVARCHAR(100) COLLATE Vietnamese_CI_AS -- Người cập nhật
);

-- Thêm cột hình ảnh cho Categories
ALTER TABLE Categories
ADD CategoryImage NVARCHAR(255); -- Đường dẫn hoặc URL hình ảnh

-- Thêm dữ liệu vào Categories
INSERT INTO Categories (CategoryName, Description, CategoryImage, CreateBy, UpdateBy)
VALUES
(N'Điện thoại', N'Danh mục các sản phẩm điện thoại di động', N'dienthoai.png', N'Admin', N'Admin'),
(N'Laptop', N'Danh mục các sản phẩm máy tính xách tay', N'laptop.png', N'Admin', N'Admin'),
(N'Phụ kiện', N'Danh mục các sản phẩm phụ kiện công nghệ', N'phukien.png', N'Admin', N'Admin');

-- Tạo bảng Brand
CREATE TABLE Brand (
    BrandID INT IDENTITY(1,1) PRIMARY KEY,     -- ID tự tăng
    BrandName NVARCHAR(255) COLLATE Vietnamese_CI_AS NOT NULL,          -- Tên thương hiệu
    Description NVARCHAR(MAX) COLLATE Vietnamese_CI_AS,                 -- Mô tả thương hiệu
    CreateAt DATETIME DEFAULT GETDATE(),       -- Thời gian tạo
    CreateBy NVARCHAR(100) COLLATE Vietnamese_CI_AS,                    -- Người tạo
    UpdateAt DATETIME DEFAULT GETDATE(),       -- Thời gian cập nhật
    UpdateBy NVARCHAR(100) COLLATE Vietnamese_CI_AS,                    -- Người cập nhật
    IsPopular BIT DEFAULT 0                    -- Thương hiệu phổ biến (0 = Không, 1 = Có)
);

-- Thêm dữ liệu vào Brand
INSERT INTO Brand (BrandName, Description, CreateBy, UpdateBy, IsPopular)
VALUES
(N'Apple', N'Thương hiệu nổi tiếng với các sản phẩm iPhone, iPad và MacBook.', N'Admin', N'Admin', 1),
(N'Samsung', N'Thương hiệu hàng đầu về điện thoại, TV và các sản phẩm gia dụng.', N'Admin', N'Admin', 1),
(N'Sony', N'Thương hiệu chuyên về điện tử và các sản phẩm giải trí.', N'Admin', N'Admin', 0),
(N'Dell', N'Thương hiệu uy tín trong lĩnh vực máy tính và thiết bị văn phòng.', N'Admin', N'Admin', 1),
(N'Xiaomi', N'Thương hiệu nổi tiếng về các sản phẩm công nghệ giá rẻ và chất lượng.', N'Admin', N'Admin', 1);

-- Ràng buộc khóa ngoại
ALTER TABLE Product
ADD CONSTRAINT FK_Products_Categories FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

ALTER TABLE Product
ADD CONSTRAINT FK_Products_Brands FOREIGN KEY (BrandID) REFERENCES Brand(BrandID);

-- Tạo bảng Users
CREATE TABLE Users (
    idUser INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) COLLATE Vietnamese_CI_AS,
    LastName NVARCHAR(50) COLLATE Vietnamese_CI_AS,
    Email NVARCHAR(50),
    Password NVARCHAR(50)
);

-- Tạo bảng Order
CREATE TABLE [Order] (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) COLLATE Vietnamese_CI_AS NOT NULL,
    UserId INT NOT NULL,
    Status INT NOT NULL,
    CreatedOnUtc DATETIME NOT NULL
);

-- Tạo bảng OrderDetail
CREATE TABLE OrderDetail (
    Id INT PRIMARY KEY IDENTITY(1,1),
    OrderId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL,
    CONSTRAINT FK_OrderDetail_Order FOREIGN KEY (OrderId) REFERENCES [Order](Id),
    CONSTRAINT FK_OrderDetail_Product FOREIGN KEY (ProductId) REFERENCES Product(ProductID)
);
