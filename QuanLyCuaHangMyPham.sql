USE [master]
GO
/****** Object:  Database [QuanLyCosmetic]    Script Date: 3/16/2022 2:31:43 AM ******/
CREATE DATABASE [QuanLyCosmetic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyCosmetic', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\QuanLyCosmetic.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyCosmetic_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\QuanLyCosmetic_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QuanLyCosmetic] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyCosmetic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyCosmetic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyCosmetic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyCosmetic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyCosmetic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyCosmetic] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyCosmetic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyCosmetic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyCosmetic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyCosmetic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyCosmetic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyCosmetic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyCosmetic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyCosmetic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyCosmetic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyCosmetic] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyCosmetic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyCosmetic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyCosmetic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyCosmetic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyCosmetic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyCosmetic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyCosmetic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyCosmetic] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyCosmetic] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyCosmetic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyCosmetic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyCosmetic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyCosmetic] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyCosmetic] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyCosmetic', N'ON'
GO
ALTER DATABASE [QuanLyCosmetic] SET QUERY_STORE = OFF
GO
USE [QuanLyCosmetic]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [QuanLyCosmetic]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/16/2022 2:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](150) NOT NULL,
	[Password] [varchar](150) NOT NULL,
	[Status] [varchar](150) NULL,
	[Role] [int] NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 3/16/2022 2:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[Bill_ID] [int] NOT NULL,
	[User_ID] [int] NOT NULL,
	[Total_Price] [int] NOT NULL,
	[Selling_Date] [date] NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[Tel] [int] NOT NULL,
	[Payment_Method] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[Bill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/16/2022 2:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Category_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Line]    Script Date: 3/16/2022 2:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Line](
	[OrderLine_ID] [int] NOT NULL,
	[Bill_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Order_Line] PRIMARY KEY CLUSTERED 
(
	[OrderLine_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/16/2022 2:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Image_URL] [varchar](2048) NOT NULL,
	[Price] [int] NOT NULL,
	[Publisher_ID] [int] NOT NULL,
	[Detail] [nvarchar](4000) NOT NULL,
	[Category_ID] [int] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 3/16/2022 2:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[Publisher_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
(
	[Publisher_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 3/16/2022 2:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[Stock_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Status] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[Stock_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([User_ID], [UserName], [Password], [Status], [Role]) VALUES (1, N'MrA', N'123', N'ON', 1)
INSERT [dbo].[Account] ([User_ID], [UserName], [Password], [Status], [Role]) VALUES (2, N'abc', N'222', N'ON', 0)
INSERT [dbo].[Account] ([User_ID], [UserName], [Password], [Status], [Role]) VALUES (6, N'Mrb', N'123', N'ON', 0)
INSERT [dbo].[Account] ([User_ID], [UserName], [Password], [Status], [Role]) VALUES (18, N'admin', N'123', N'ON', 1)
INSERT [dbo].[Account] ([User_ID], [UserName], [Password], [Status], [Role]) VALUES (22, N'123', N'1234', N'ON', 0)
INSERT [dbo].[Account] ([User_ID], [UserName], [Password], [Status], [Role]) VALUES (23, N'pham', N'123', N'ON', 0)
INSERT [dbo].[Account] ([User_ID], [UserName], [Password], [Status], [Role]) VALUES (24, N'phamtiendat', N'123', N'ON', 0)
INSERT [dbo].[Account] ([User_ID], [UserName], [Password], [Status], [Role]) VALUES (25, N'hung', N'123', N'ON', 0)
INSERT [dbo].[Account] ([User_ID], [UserName], [Password], [Status], [Role]) VALUES (26, N'hung1', N'123', N'ON', 0)
INSERT [dbo].[Account] ([User_ID], [UserName], [Password], [Status], [Role]) VALUES (27, N'datdz', N'123', N'ON', 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Category_ID], [Name]) VALUES (1, N'Son môi')
INSERT [dbo].[Category] ([Category_ID], [Name]) VALUES (2, N'Kem chống nắng')
INSERT [dbo].[Category] ([Category_ID], [Name]) VALUES (3, N'Sữa rửa mặt')
INSERT [dbo].[Category] ([Category_ID], [Name]) VALUES (4, N'Kem nền')
INSERT [dbo].[Category] ([Category_ID], [Name]) VALUES (5, N'Viên uống')
INSERT [dbo].[Category] ([Category_ID], [Name]) VALUES (6, N'Tẩy trang + Tonner')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (74, N'Son Black Rouge – A12', N'https://kyo.vn/wp-content/uploads/2019/03/black-rouge-airfit-velvet-A12-21.jpg', 240000, 4, N'Sở hữu tone màu đỏ nâu – đẹp lạ, Black rouge Air Fit Velvet Tint Ver 8 màu A12 Đỏ Nâu thường xuyên được lựa chọn sử dụng cả khi mặt mộc và khi makeup. Được đánh giá là tone màu có khả năng tôn da, trắng răng nhất nên sẽ không làm các nàng thất vọng kể cả những các có làn da ngăm, da vàng nha.', 1, 31)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (75, N'Son Black Rouge – A23', N'https://images.depxinh.net/products/item.11_2021/19/detail/son-black-rouge-a23-2.jpg', 250000, 1, N'Em son đỏ cam đất này cân đối hài hòa giữa sắc đỏ pha cam thêm chút đất, không quá tươi cũng không quá trầm. Đây vốn là tông màu son đạt chuẩn quen thuộc và hiếm khi lỗi mốt nhờ công dụng tôn da lẫn tôn răng với các chị em. Điểm cộng của màu son A23 là em nó vô cùng dễ dùng và vẫn giữ được sự trendy cần thiết. Đặc biệt là dịp lễ hội cuối năm nhộn nhịp này, các nàng chỉ cần quánh em í lên môi chút xíu xiu là đã đủ rạng rỡ hết phần thiên hạ rồi. ', 1, 50)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (77, N'Son Tom Ford Màu 06 Flame', N'https://lipstick.vn/wp-content/uploads/2019/10/Son-Tom-Ford-Flame-06.png', 1200000, 3, N'Son đỏ cam đẹp nhất trong giới son high-end, chính là son Tom Ford 06 Flame. Đệ nhất đỏ cam này là “gương mặt đại diện” cho dòng Lip Color Matte của thương hiệu Tom Ford. Màu son quyến rũ, ảo diệu như chứa đựng sức hút mãnh liệt, khiến ai nấy đều ước ao sở hữu. Son vỏ đen viền vàng sang hết nấc, đi kèm chất lì mịn đỉnh cao, bền màu đến 8 giờ đồng hồ liền.', 1, 60)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (79, N'Son Tom Ford Màu 07 Ruby', N'https://lipstick.vn/wp-content/uploads/2016/06/son-tom-ford-07.jpg', 1200000, 3, N'Son Tom Ford 07 Ruby Rush màu đỏ tươi thuộc dòng son lì màu đỏ tươi – Lip Color Matte, có mùi vanila nhẹ nhàng, son mềm môi, lâu trôi, giữ màu hoàn hảo sau cả ngày làm việc, lên màu cực chuẩn, và đặc biệt che khuyết điểm rất tốt cho môi sẫm màu/ môi thâm, chất son khi đánh lên mịn như nhung, lại cực mềm môi và rất dễ chịu.

Son Tom Ford Ruby Rush 07 là cái tên kinh điển là sắc đỏ huyền thoại của BST Lip Color Matte đến từ nhà Tom Ford lừng danh. Son sở hữu tông màu đỏ tươi ruby thu hút, quyến rũ và tôn da.', 1, 30)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (82, N'Son Tom Ford Màu 16', N'https://cf.shopee.vn/file/0b1fb5921a0bb50c85a7cf205c6f1a53', 1350000, 2, N'Trong “khu vườn hương sắc” đỉnh cao nhà Tom Ford, có một sắc đỏ quyến rũ nhất ai cũng lưu luyến và chờ đón rinh về, là son Tom Ford 16 Scarlet Rouge. Son đỏ biểu tượng của dòng Lip Color. Son vỏ ngoài vuông, màu đen bao phủ, đan xen viền vàng quyền quý. Chất son khiến môi mọng căng cực kỳ, che phủ tốt, bền màu dài lâu. ', 1, 20)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (86, N'KCN La Roche Posay SPF 50+', N'https://www.hangngoainhap.com.vn/images/202102/goods_img/1496-p2-1612574678.jpg', 450000, 2, N'Sữa Chống Nắng Không Nhờn Rít La Roche-Posay Anthelios Invisible Fluid SPF50+ 50ml là sản phẩm chống nắng đến từ thương hiệu dược mỹ phẩm La Roche-Posay của Pháp, với khả năng chống nắng đứng đầu trong dòng chống nắng Anthelios, giúp bảo vệ da trước tia UVA và UVB gây hại đồng thời ngăn ngừa tổn thương da do tia hồng ngoại và ô nhiễm môi trường.', 2, 50)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (87, N'KCN Anessa Essence(Sữa)', N'https://cowslip.vn/upload/images/blogs/review-cac-loa%CC%A3i-kem-chong-nang-anessa.png', 400000, 4, N'Kem chống nắng Nhật Bản Anessa tự hào là thương hiệu chống nắng số 1 tại Nhật Bản suốt 17 năm liền. Sản phẩm chống nắng toàn diện với độ phổ rộng, SPF 50++, thấm thấu nhanh. Chất kem mềm mịn, có khả năng dưỡng ẩm cho da và làm lớp nền trang điểm. Tiêu chuẩn 5 không: không màu, không mùi, không cồn, không dầu khoáng, không paraben. Công nghệ Hydrat hoá làn da giúp dưỡng ẩm, ngậm nước cho làn da. Kem chống nắng Anessa được kiểm chứng an toàn từ các chuyên da da liễu.

Công nghệ Aqua Booster giúp chống thấm nước, mồ hôi hiệu quả, tạo màng chắn trước tác hại của tia cực tím. Sản phẩm cực kì dịu nhẹ và hiệu quả chống nắng cao đối với mọi loại da làn da, kể cả da nhạy cảm và da em bé.    ', 2, 50)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (89, N'Klairs Soft Airy UV Essence', N'https://bloganchoi.com/wp-content/uploads/2019/04/kem-chong-nang-13.jpg', 450000, 2, N'Kem chống nắng tốt kiềm dầu, chống lão hoá
Klairs Soft Airy UV Essence Spf 50 PA được yêu thích trong thời gian gần đây. Sản phẩm kem chống nắng nhà Dear Klairs không chỉ bao bì đẹp mắt mà chất lượng cũng cực tốt dành cho những nàng da dầu mụn. Kem có chỉ số chống nắng 50 SPF giúp bảo vệ da tối ưu dưới tác động ánh nắng mặt trời. Ngoài ra, thành phần dưỡng ẩm còn bổ sung dưỡng chất cần thiết cho da. 

Klairs Soft Airy UV Essence còn có tính kiềm dầu và chống oxy hoá cho da. Kem có tính thẩm thấu cao, cực dễ chịu khi sử dụng.', 2, 100)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (91, N'Sữa chống nắng dưỡng ẩm', N'https://bloganchoi.com/wp-content/uploads/2019/08/kem-chong-nang-duong-am-sunplay-uv-moisture-milk-1.jpg', 162000, 2, N'Kem Chống Nắng Bình Dân Dưỡng Da Từ Sâu Bên Trong
Không chỉ chống nắng hiệu quả với chỉ số SPF 50+ PA, Sunplay Skin còn dưỡng ẩm cho làn da, tái tạo làn da, ngăn ngừa lão hoá sớm. Sunplay bổ sung độ ẩm cho làn da luôn được mềm mại và mịn màng.

Kem chống nắng Nhật Bản được hàng triệu phụ nữ Việt tin dùng. Kem có khả năng thẩm thấu cực nhanh, không chứa cồn và kháng nước hiệu quả. Bên cạnh đó, Sunplay còn dùng được làm lót trang điểm một cách hiệu quả. Ngoài chống nắng hiệu quả, kem chống nắng AQUA còn cấp nước, dưỡng ẩm cho da nhờ công nghệ AQUA Boost không chứa cồn. Công nghệ này sửa dụng Hyaluronic, collagen,amino acid  giúp duy trì độ ẩm tự nhiên và ngăn chặn quá trình mất nước của da. Với công thức không chưa cồn, kem mang lại cảm giác dịu nhẹ và có thể sử dụng được với da nhạy cảm. Ngoài chống nắng hiệu quả, kem chống nắng AQUA còn cấp nước, dưỡng ẩm cho da nhờ công nghệ AQUA Boost không chứa cồn. Công nghệ này sửa dụng Hyaluronic, collagen,amino acid  giúp duy trì độ ẩm tự nhiên và ngăn chặn quá trình mất nước của da. Với công thức không chưa cồn, kem mang lại cảm giác dịu nhẹ và có thể sử dụng được với da nhạy cảm. Ngoài chống nắng hiệu quả, kem chống nắng AQUA còn cấp nước, dưỡng ẩm cho da nhờ công nghệ AQUA Boost không chứa cồn. Công nghệ này sửa dụng Hyaluronic, collagen,amino acid  giúp duy trì độ ẩm tự nhiên và ngăn chặn quá trình mất nước của da. Với công thức không chưa cồn, kem mang lại cảm giác dịu nhẹ và có thể sử dụng được với da nhạy cảm.', 2, 70)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (93, N'Kem chống nắng Vichy ', N'https://media.hasaki.vn/wysiwyg/HaNguyen/kem-chong-nang-vichy-thoang-nhe-khong-bong-dau-spf-50-50ml.jpg', 470000, 2, N'Không Gây Nhờn Rít, Không Màu Cho Làn Da

Nếu bạn tìm kiếm sản phẩm kem chống nắng không màu, không gây nhờn rít thì SPF50 Vichy Capital Soleil SPF50 Face Dry Touch là lựa chọn hoàn hảo.

4 màng lọc bảo vệ da trước tia cực tím. Chỉ số chống nắng cao với SPF 50. Khả năng thẩm thấu vô cùng cực nhanh, không để lại vệt trắng khiến bạn khó chịu. Cảm giác sau khi thoa kem chống nắng vẫn khô thoáng và thoải mái.

Những dòng sản phẩm đến từ Vichy luôn được đông đảo chị em phụ nữ yêu thích. Bởi vậy, kem chống nắng chống nắng không màu, không gây nhờn rít thì SPF50 Vichy Capital Soleil SPF50 Face Dry Touch đáng được thử, bạn không nên bỏ qua. Kem chống nắng tốt bổ sung độ ẩm, không gây cảm giác khô da, nặng da.', 2, 80)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (95, N'KCN cho da dầu mụn Laneige ', N'https://vitrangreview.com/wp-content/uploads/2021/03/review-kem-chong-nang-laneige-light-sun-fluid-spf-pa-sieu-tham-khong-bet-dinh-1.jpg', 600000, 2, N'Nhẹ Nhàng Chống Nắng Cho Da Dầu & Da Hỗn Hợp

Làn da dầu và hỗn hợp được chống nắng hoàn hảo hơn với Laneige Light Sun Fluid SPF50+ PA+++.

Dạng lỏng nhẹ với kết cấu mỏng, nhẹ không dày dính khiến Lanige thẩm thấu nhanh vào da. Với làn da dầu thường xuyên tiết bã nhờn thì đây là sản phẩm cực kỳ phù hợp, kiểm soát lượng dầu thừa, bã nhờn cho da. Công thức mỏng nhẹ như sữa dưỡng ẩm cho làn da luôn được mịn màng. 

Không đơn thuần là sản phẩm chống nắng, kem chống nắng còn chăm sóc làn da luôn được tươi trẻ và tràn đầy sức sống. Nếu đang gặp những khó khăn khi lớp trang điểm dễ bị trôi do lượng dầu nhờn hoạt động mạnh, nhất vùng chữ T, Laneige Light Sun Fluid SPF50+ PA+++ là sự lựa chọn hoàn hảo cho làn da.', 2, 90)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (97, N'SRM Innisfree Green Tea ', N'https://cf.shopee.vn/file/ac630640381230f2ec376c00ef098d8a', 190000, 3, N'Sữa Rửa Mặt Chiết Xuất Từ Trà Xanh Innisfree Green Tea Foam Cleanser là sữa rửa mặt trà xanh thuộc thương hiệu Innisfree, thích hợp cho da bị kích ứng với ô nhiễm môi trường, da có mụn nhưng không quá khẩn cấp (khẩn cấp và nhiều mụn khuyên dùng bộ Jeju Bija). Có khả năng làm sạch sâu, tái tạo mới làn da, làm sáng da, chống oxy hóa và ngăn ngừa mụn, viêm hiệu quả.', 3, 60)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (98, N'SRM Thải Độc Super Vegitoks ', N'https://product.hstatic.net/1000025647/product/super-vegitoks-cleanser.jpg', 300000, 4, N'Đây là một trong những dòng sữa rửa mặt mà mình cực thích hiện nay, với 3 tác dụng: tẩy trang, làm sạch sâu và thải độc cho da.

Có khả năng thải độc chì dần dần do mỹ phẩm hoặc hậu quả của kem trộn để lại.

Mùi hương thì khá ổn, không quá nồng. Kết cấu dạng gel lỏng, khi apply lên da tạo ra bọt sủi giúp thải độc và làm sạch da.

Điểm đặc biệt là cực kỳ nhẹ dịu, an toàn cho da. Sau khi rửa xong da mềm mịn và không hề khô căng.

Hỗ trợ làm sạch và giảm các loại mụn đầu đen, mụn viêm, bọc, mủ, ẩn,…

Super Vegitoks Cleanser được xem là sản phẩm có thể dùng được cả cho da nhạy cảm. – Được làm hoàn toàn 100% thành phần rau củ như: Bắp Cải, Su Hào, Cần Tây, Chanh, Súp Lơ, Lá Rau Diếp Cá, Cà Chua, Mầm Lúa Mì ,.. giúp cung cấp thêm dưỡng chất để nuôi dưỡng làn da từ bên trong.', 3, 50)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (99, N'Sữa rửa mặt Cetaphil', N'https://www.cetaphil.com.vn/sites/default/files/sua-rua-mat-cetaphil-gia-bao-nhieu.jpg', 290000, 3, N'Với công thức lành tính, sữa rửa mặt Cetaphil Gentle Skin Cleanser giúp loại bỏ bụi bẩn một cách nhẹ nhàng. Bên cạnh đó, Cetaphil Skin Cleanser còn không gây bít tắc lỗ chân lông, có khả năng duy trì độ ẩm tự nhiên và phù hợp với mọi loại da, kể cả làn da mỏng manh của bé sơ sinh.', 3, 200)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (100, N'SRM La Roche-Posay', N'https://media.hasaki.vn/wysiwyg/HaNguyen/gel-rua-mat-la-roche-posay-danh-cho-da-dau-nhay-cam-01.jpg', 399000, 2, N'Sữa Rửa Mặt Dạng Gel Cho Da Dầu Mụn La Roche-Posay Effaclar Purifying Foaming Gel For Oily Sensitive Skin là sữa rửa mặt giúp nhẹ nhàng làm sạch bụi bẩn và bã nhờn dư thừa - nguyên nhân chính gây nên mụn. Không làm khô da nhờ các thành phần làm sạch nhẹ nhàng được lựa chọn kỹ càng. Mang lại cảm giác tươi mát và dễ chịu cho làn da thuộc thương hiệu dược mỹ phẩm La Roche-Posay đến từ Pháp.', 3, 50)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (101, N'SRM Huxley Secrect ', N'https://barbieshop.vn/wp-content/uploads/2019/12/sua-rua-mat-huxley-8.jpg', 299000, 3, N'Sữa Rửa Mặt Dạng Bọt - Huxley Secret Of Sahara Cleansing Foam: Deep Clean, Deep Moist 100ml

Sữa Rửa Mặt Dạng Bọt - Huxley Secret Of Sahara Cleansing Foam: Deep Clean, Deep Moist là dạng sữa rửa mặt tạo bọt có thành phần chiết xuất từ cây xương rồng giúp cấp ẩm cho da, loại bỏ sạch lớp trang điểm và bụi bẩn ẩn sâu bên trong lỗ chân lông. Thành phần thiên nhiên không gây kích ứng, an toàn khi sử dụng.
', 3, 44)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (102, N'Sữa rửa mặt Naruko Tea ', N'https://cf.shopee.vn/file/837f32fbd2ee595a70437493a66eaddf', 150000, 3, N'Sữa Rửa Mặt Bùn Trị Mụn Chiết Xuất Tràm Trà Naruko Tea Tree Purifying Clay Mask & Cleanser In 1 là sữa rửa mặt bùn trà tràm Naruko làm sạch sâu, cân bằng dầu trên da; ngăn ngừa, hạn chế sinh mụn đầu đen, mụn trứng cá lấy đi tế bào chết nhẹ nhàng; giúp ngăn ngừa tình trạng tắc nghẽn lỗ chân lông thuộc thương hiệu Naruko đến từ Đài Loan', 3, 66)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (104, N'Kem nền Lancome', N'https://ireviewholic.com/wp-content/uploads/2020/02/88F86DA4-B1E0-4059-A1CE-FB8F1716913A-scaled.jpeg', 1400000, 2, N'Kem nền Teint Idole sẽ là người đồng hành hoàn hảo, cùng bạn vượt mọi thử thách trong ngày dài căng thẳng và bận rộn. Đây là loại kem nền có độ che phủ hoàn hảo cho thói quen trang điểm của bạn.

Công thức phù hợp với mọi tông da và loại da, kể cả da khô và nhạy cảm.
Ra mắt 50 tông màu phù hợp với 99% làn da của phụ nữ * với công thức chứa chuẩn sắc tố NAI giúp duy trì độ PH của da, mang đến màu sắc trung thực cả ngày, mà không gây cảm giác dày phấn hay vón cục.
*DỰA TRỂN NGHIÊN CỨU 240 PHỤ NỮ Ở PHÁP SỬ DỤNG KEM NỀN TEINT IDOLE', 4, 77)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (105, N'Kem nền MAC', N'https://dncosmetics.vn/wp-content/uploads/2017/05/kem-nen-mac.jpg', 692000, 1, N' Nếu các Nàng hay trang điểm, thông thường những phấn nền dạng lỏng thường có lớp phấn dày, trang điểm không tự nhiên, gây bí da…gạt bỏ qua những nổi lo của phái đẹp về trang điểm, kem nền Mac Studio Fix Fluid là một sự lựa chọn hoàn toàn đáng tin tưởng trong việc làm đẹp của phái đẹp. Đây là sản phẩm kem nền lâu đời và bán chạy nhất của Mac.', 4, 22)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (106, N'Kem nền Loreal True Match ', N'https://cf.shopee.vn/file/993686019185e5613d93dac142820558', 320000, 2, N'Kem nền mịn da dạng lỏng L''Oreal Paris True Match Liquid Foundation 30ml chứa các hạt phấn dạng lỏng siêu mịn với công nghệ Micro-Matching che phủ hoàn hảo đem lại cho bạn làn da mịn màng tươi sáng tự nhiên. Ngoài ra với khả năng chống nắng lên đến SPF16 giúp bảo vệ làn da trước mọi ảnh hưởng của ánh nắng mặt trời. Sản phẩm có tông màu phù hợp với làn da châu Á, mang lại cho bạn lớp trang điểm nền hoàn hảo.', 4, 33)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (108, N'Kem nền Bobbi Brown', N'https://thuvienmuasam.com/uploads/default/original/2X/c/c35ba42cf3bba423b0fd468aa52b86c45421179c.jpeg', 1400000, 3, N'Kem nền kiềm dầu lâu trôi Bobbi Brrown Skin Long-Wear Weightless Foundation SPF 15 PA++30ml là một trong những dòng kem nền được yêu thích nhất của thương hiệu mỹ phầm cao cấp Bobbi Brown mang đến lớp nền mỏng nhẹ nhưng che phủ hoàn hảo mọi khuyết điểm trên da, với hiệu ứng finish mịn lì tự nhiên, độ kiềm dầu cao và khả năng bền màu lên đến 16 giờ
Đặc điểm nổi bật: có độ che phủ cao, giúp mang lại một lớp nền mịn lì hoàn hảo không tì vết nhưng vẫn nhẹ mặt và vô cùng tự nhiên, đi kèm với chỉ số chống nắng SPF15 giúp bảo vệ làn da trước tia UV gây hại.', 4, 55)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (109, N'Kem nền Clinique ', N'https://cf.shopee.vn/file/261bdacfb7295ee00d9d7cd89e2710e7', 750000, 2, N'- Kem nền Clinique Acne Solutions Liquid Makeup không gây mụn cho làn da dầu và mụn nhạy cảm. 

- Kem có khả năng che khuyết điểm, kiểm soát mụn, trung hoà sự xuất hiện mẫn đỏ và giúp ngăn ngừa mụn , cung cấp độ che phủ vừa phải cho làn da mịn màng tự nhiên. 

- Bởi sản phẩm không chứa dầu nên không gây bít tắc lỗ chân lông, không khiến cho những nàng da dầu/da mụn có cảm giác khó chịu. 

- Phải nói đây là một loại kem nền siêu tự nhiên, không bóng dầu, rất khó để nhận ra lớp nền này trên da bạn.

- Về mức độ che phủ của em này thì chỉ thuộc loại trung bình, che phủ được một số mụn nhỏ, còn những mụn bọc lớn thì hông hề hấn gì đồng thời làm lộ rất rõ những mảng da khô nhưng chỉ cần thêm chút kem che khuyết điểm nữa thì không hề chi.

- Có nhiều tone từ trắng đến trung bình.

Thương hiệu: Clinique

Khối lượng: 30ml

Xuất xứ: Belgium', 4, 66)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (110, N'Nước tẩy trang Nivea Micell', N'https://bloganchoi.com/wp-content/uploads/2020/06/nuoc-tay-trang-nivea.jpg', 285000, 3, N'♣  Tăng sự hấp thụ oxy – Nước Nivea Micellar loại bỏ hoàn toàn mạnh mẽ. Làm tăng sự hấp thu O2 của da.
♣  Nước tẩy trang MicellAir – Việc làm sạch micelle này thuyết phục với công thức vượt trội. Dễ dàng loại bỏ lớp trang điểm, bụi bẩn.
♣  0% dư lượng sản phẩm – Các Nivea Micellar Facial Cleansing với Black Tea Extract loại bỏ trang điểm dễ dàng.

♣  Các toner trên khuôn mặt mà không có nước hoa cũng thuyết phục như một loại dầu make – up không gây hại và tốt cho mắt
♣  Dễ sử dụng – Sử dụng Nivea Micellar vào một miếng bông và đặt trên mặt để làm sạch nhẹ nhàng mà không cần rửa sạch. Khả năng tương thích được xác định về mặt da và nhãn khoa', 6, 89)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (111, N'Nước tẩy trang Simple ', N'https://www.simpleskincare.com/sk-eu/content/dam/brands/simple/global_use/1930418-simple-kind-to-skin-micellar-cleansing-water-200ml-bc-si.jpg.rendition.767.767.jpg', 150000, 2, N'Nước Tẩy Trang Simple Micellar Cleansing Water Làm Sạch và Cấp Ẩm Cho Da 200ml
Simple hướng tới sự lành tính và hiệu quả cho mọi loại da, đặc biệt không chứa 2,000 hóa chất có hại an toàn với cả làn da nhạy cảm nhất. Đồng thời, với sự kết hợp giữa các dưỡng chất thiết yếu cùng với các thành phần tự nhiên mà vẫn hiệu quả, giúp mang lại cho bạn làn da trông khỏe mạnh và đàn hồi.', 6, 78)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (114, N'Nước Tẩy Trang La Roche', N'https://cf.shopee.vn/file/b03a879948288cb1e0bc081b4e44ebf3', 379000, 4, N'Sử dụng nước suối khoáng Therma Spring Water có tác dụng làm dịu da ngay lập tức đồng thời chống oxy hóa.

Thương hiệu dược mỹ phẩm La Roche-Posay luôn lắng nghe làn da nhạy cảm của bạn.

Đặc chế sinh ra cho những bạn có da dầu La Roche-Posay Effaclar Micellar Water Ultra Oily Skin nói không với chất tạo hương, chất tạo màu, cồn và thành phần Paraben độc hại.

Nước tẩy trang được kiểm nghiệm trên những làn da dễ kích ứng nhất và đảm bảo hoàn toàn an toàn cho người sử dụng.', 6, 33)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (115, N'Bông tẩy trang Silcot ', N'https://cdn.tgdd.vn/Products/Images/3708/155790/bhx/bong-trang-diem-silcot-82-2-700x467.jpg', 35000, 1, N'Bông trang điểm (bông tẩy trang) Silcot 82 miếng/hộp là một trong những loại bông tẩy trang tốt nhất hiện nay được chị em tin dùng. Bông trang điểm (bông tẩy trang) Silcot 82 miếng/hộp có xuất xứ từ Nhật Bản. Silcot là sản phẩm tẩy trang bán chạy số 1 tại Nhật Bản trong suốt hơn 10 năm liền, hứa hẹn mang đến cho người sử dụng sự chăm sóc da tốt nhất.



Thiết kế:

Đóng hộp tiện lợi: Bông tẩy trang được đóng hộp giấy khá đẹp mắt và tiện dụng, bạn có thể cất gọn và bảo quản dễ dàng khi chưa sử dụng hết
Sợi bông thấm được dàn đều cùng thiết kế dạng túi thông minh, hoàn toàn không để lại xơ bông trên da, đồng thời giúp tiết kiệm nước dưỡng da tối ưu nhờ kết cấu sợi bông đặc biệt
Ưu điểm:

Nhẹ nhàng và không gây kích ứng cho làn da
Chất bông mềm mại như lụa, êm ái như nhung, không bị xù hay xơ, độ dày vừa phải
Giúp tẩy trang và làm sạch mọi bụi bẩn trên da
Nhẹ nhàng tẩy sạch toàn bộ làn da kể cả vùng da nhạy cảm quanh mắt và môi
Giúp lấy đi lớp trang điểm 1 cách dễ dàng nhưng vẫn giữ lại độ ẩm cần thiết cho da mà không gây kích ứng hay tổn hại da
Cách dùng:

Thấm miếng bông với nước hoa hồng, dung dịch dưỡng da hoặc nước tẩy trang
Nhẹ nhàng vỗ nhẹ lên toàn bộ khuôn mặt
Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp và nhiệt độ cao', 6, 500)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (116, N'Bông tẩy trang Ipek ', N'https://product.hstatic.net/1000006063/product/771_fc911b6141f44ae7817d5dd91a6870ee_1024x1024.jpg', 24000, 3, N'Bông tẩy trang ipek thổ nhĩ kì 150 miếng ( 120+30 miếng) có xuất xứ từ Thổ Nhĩ Kì, là loại bông tẩy trang tốt nhất hiện nay được chị em tin dùng mà Toplist muốn chia sẻ với bạn. Sản phẩm bông tẩy trang Ipek rất được lòng các bạn trẻ nhờ những ưu điểm tuyệt vời trong một mức giá rẻ.

', 6, 200)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (117, N'Bông Tẩy Trang AHC', N'https://cf.shopee.vn/file/d76298869bee8b80c3e65c09a263d4a3', 100000, 2, N'Bông Tẩy Trang AHC đến từ mỹ phẩm AHC, là loại bông tẩy trang tốt được phái đẹp rất yêu thích và tin dùng hiện nay. So với những dòng sản phẩm khác, Bông Tẩy Trang AHC hỗ trợ làm sạch hiệu quả có lớp bông dày,bề mặt bông được thiết kế lồi lõm, khiến cho việc tẩy trang trở nên hiệu quả hơn.', 6, 150)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (119, N'Bông tẩy trang TheFace Shop ', N'https://salt.tikicdn.com/ts/product/e1/f2/97/39847879b2cea268f3553610ac5a0c1f.jpg', 50000, 3, N'Túi 222 Miếng Bông Tẩy Trang Lameila Cotton 3 lớp đến từ Trung Quốc, là một trong những loại bông tẩy trang tốt nhất hiện nay được chị em tin dùng. Túi 222 Miếng Bông Tẩy Trang Lameila Cotton 3 lớp cực kỳ phù hợp để sử dụng trên làn da nhạy cảm. Ngoài tẩy trang, sản phẩm Túi 222 Miếng Bông Tẩy Trang Lameila Cotton 3 lớp cũng được ưa chuộng vì giá thành rẻ.', 6, 500)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (120, N'Bông Tẩy Trang Watsons ', N'https://cf.shopee.vn/file/98e29dd7b9e6933f49aed6dbbfcf27b2', 40000, 2, N'Bông Tẩy Trang Watsons Love My Softness Soft & Clean Side Sealed Facial Puff Cuốn Biên 100 Miếng có cấu tạo từ 100% cotton nguyên chất, giúp bạn dễ dàng lấy đi mọi bụi bẩn và lớp make up trên da. Được cấp bằng sáng chế về nguyên liệu đầu vào và sản xuất sản phẩm chăm sóc da và cơ thể, thân thiện với cơ thể và môi trường.', 6, 200)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (121, N'Bộ bông tẩy trang Miniso', N'https://vn-live-05.slatic.net/p/862d54866709b41b157382697ab2082c.jpg_720x720q80.jpg_.webp', 100000, 3, N'Bộ bông tẩy trang từ bông cao cấp cotton pad Miniso từ lâu đã là cái tên quen thuộc của những cô nàng quan tâm về mỹ phẩm. Miniso là một thương hiệu đến từ Nhật Bản - đất nước Mặt Trời mọc. Các sản phẩm của Miniso luôn có giá rẻ cùng chất lượng tốt. Bộ bông tẩy trang từ bông cao cấp cotton pad Miniso cũng không nằm ngoài điều này.', 6, 100)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (122, N'Bông Tẩy Trang Lily Bell ', N'https://myphamhang.com/wp-content/uploads/2020/09/bong-tay-trang-lily-bell-lilian-puff-cotton-11.jpg', 70000, 2, N'Bông Tẩy Trang Bella Cotton Premium được làm từ 100% cotton nguyên chất, không dùng bất cứ chất hóa học nào để xử lý.

Bề mặt miếng bông rất mềm mịn và dai, không bị xù lông nên vô cùng an toàn cho làn da nhạy cảm.

Miếng bông có thiết kế hình vuông, kích thước 5x6cm rất vừa vặn, 2 mặt bông được ép chặt, hạn chế tình trạng xơ rách trong quá trình sử dụng.

Thích hợp dùng để bôi lotion hoặc toner, cực kỳ tiết kiệm nước tẩy trang, toner hoặc chùi sơn móng.', 6, 50)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (126, N'Bông tẩy trang FOCALLURE ', N'https://cf.shopee.vn/file/bd1602d1f04d677e2e216b170a3184e2', 20000, 3, N'Bông tẩy trang siêu thấm, mềm mại và tinh tế, tán đều
  Đàn hồi dịu nhẹ, không gây kích ứng da, độ dẻo cao, không dễ rách, không để lại xơ vải.
  Thích hợp cho mọi loại da.
  
  Hướng dẫn sử dụng:
  1. Tẩy trang: Nhúng sản phẩm trang điểm bằng miếng bông, nhẹ nhàng dặm vào mắt hoặc môi, sau đó rửa sạch bằng sữa rửa mặt sau khi lớp trang điểm mờ dần.
  2. Chăm sóc da: Nắm chặt miếng bông bằng ngón tay trỏ và nhúng một ít nước trang điểm với bề mặt mịn như lụa, vỗ nhẹ lên mặt cho đến khi nước trang điểm được hấp thụ từ từ.
  3. Lau sơn móng tay: Nhúng một ít nước tẩy sơn móng tay và bọc móng tay của bạn, đợi trong một phút, sơn móng tay sẽ tan bớt.', 6, 50)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (127, N'Bông Tẩy Trang Ceiba', N'https://cf.shopee.vn/file/674a7434a9ff9857ae00986f9306c82f', 23000, 1, N'Bông Tẩy Trang 100% Cotton Ceiba Tree sử dụng nguồn nguyên liệu 100% cotton tự nhiên, sạch và tinh khiết, không sử dụng chất tẩy trắng hay các tạp chất để sơ chế bông tẩy trang tạo độ an toàn và dịu nhẹ cho làn da nhạy cảm, mặt bông mềm mịn mang đến cảm giác mềm mại dễ chịu trên da khi sử dụng.
- Đặc điểm
Bông Tẩy Trang 100% Cotton Ceiba Tree với thiết kế thông minh dập nổi 1 mặt giúp Organic Ceiba Tree tăng khả năng làm sạch gấp 5 lần, làm sạch sâu lớp trang điểm, bụi bẩn tối đa. 
Khả năng tiết kiệm dung dịch nhờ công nghệ Ultra Boost các sợi bông được xếp lớp xen kẻ nhau giúp mặt bông bông xốp, dung dịch thấm đều mặt bông và giúp tiết kiệm dung dịch lên đến 50%.
Mặt bông rất mềm mịn, phù hợp với cả làn da cực kì nhạy cảm vì không hề gây khô ráp hay cọ xát gây tổn thương bề mặt da.
Độ bền khi ướt của bông khá dẻo dai và chắc chắn vì Bông Tẩy Trang Hữu Cơ Organic Ceiba Tree được dập viền rất kỹ nên hầu như không bị biến dạng khi co kéo từ nhiều phía. Sợi bông được kết chặt giúp không để lại xơ bông trên da khi sử dụng.', 6, 30)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (130, N'Bông tẩy trang Likado', N'https://vn-test-11.slatic.net/p/30ffd61f33e406b7c7de9c626a7f0953.jpg_800x800Q100.jpg', 27900, 3, N'Bông tẩy trang Likado 3 lớp 2 mặt chất liệu Cotton túi 222 miếng là loại bông tẩy trang tốt nhất hiện nay được chị em tin dùng. Bông tẩy trang đến từ thương hiệu mỹ phẩm cao cấp LIKADO nổi tiếng này chắc chắn sẽ không làm bạn thất vọng.', 6, 300)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (131, N'Bông tẩy trang Guardian', N'https://cf.shopee.vn/file/839f9bc5a1ef7bf008e4d3fa36d71551', 40000, 2, N'Bông tẩy trang Guardian là cái tên khá quen thuộc của các cô gái Việt Nam. Sản phẩm này có xuất xứ từ Malaysia, sở hữu những ưu điểm vượt trội, không khó để hiểu tại sao Bông tẩy trang Guardian lại là một trong những loại bông tẩy trang tốt nhất hiện nay được phái nữ yêu thích và tin dùng.', 6, 200)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (132, N'Bông Tẩy Trang JOMI', N'https://cf.shopee.vn/file/a9442fb19d8ceab56c4ffbe539241f9f', 30000, 1, N'Bông Tẩy Trang JOMI Siêu Mịn Cotton Pads là cái tên mà bạn không thể không nhắc đến khi nói về những loại bông tẩy trang tốt nhất hiện nay. Bông Tẩy Trang JOMI Siêu Mịn Cotton Pads là một sản phẩm đến từ Nhật Bản, sở hữu những ưu điểm vô cùng vượt trội.', 6, 150)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (133, N'Nước hoa hồng Simple ', N'https://media3.scdn.vn/img4/2020/08_17/bCHIgW2XMYkI4Rofr2YG.jpg', 90000, 3, N'Nước Hoa Hồng Simple Dành Cho Da Nhạy Cảm Kind to Skin Soothing Facial Toner 200ml đến từ thương hiệu chăm sóc da Simple xuất xứ Anh Quốc là sản phẩm Toner không chứa cồn được thiết kế phù hợp cho làn da nhạy cảm và dễ nổi mụn, giúp làm sạch sâu và cân bằng độ pH, cung cấp độ ẩm dịu nhẹ cho làn da, mang lại cảm giác tươi mát và sảng khoái sau khi sử dụng.', 6, 300)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (134, N'Toner Muji Nhật Bản', N'https://vtvplus.vn/muji-light-toning-water-light-review/imager_2_195116_700.jpg', 190000, 2, N'Nước hoa hồng Muji của Nhật được coi là toner siêu lành tính bởi có thành phần chính là nước khoáng tinh khiết (Kamaishi natural water), chiết xuất hạt bưởi, đặc biệt là chiết xuất lá rau sam cực kỳ lành tính, làm mát, làm dịu da, thích hợp cả với da nhạy cảm.

 • Xuất xứ: Nhật Bản

 • Thương hiệu: Muji

 • Dung tích: 200ml', 6, 200)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (135, N'Toner bí đao Cocoon ', N'https://cf.shopee.vn/file/30078064f06ca131f2fb7608118f9ce4', 157000, 3, N'Công dụng nước bí đao cân bằng da Cocoon:
- Nước cân bằng da Cocoon chứa các thành phần tự nhiên như bí đao, rau má và tràm trà.
- Sản phẩm chứa công thức không chứa cồn và có tác dụng cân bằng độ pH, giảm dầu, làm sạch lỗ chân lông, cải thiện tình trạng mụn ẩn.
- Nước bí đao cân bằng da được bổ sung thêm Vitamin B3, HA và chiết xuất cam thảo giúp cấp ẩm cho làn da luôn mịn màng và giảm thiểu các vết đỏ trên da.

Cách dùng nước bí đao cân bằng da Cocoon:
- Sau khi rửa mặt, lấy một lượng nước cân bằng vào lòng bàn tay, thoa đều lên da và vỏ nhẹ nhàng để sản phẩm thẩm thấu vào da. Tránh tiếp xúc với mắt. 
- Dùng buổi sáng và tối.', 6, 80)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (136, N'Nước hoa hồng Mamonde', N'https://xachtaynhat.net/wp-content/uploads/2021/02/Mamonde-Toner-Mamonde-Rose-Water-Hoa-H%E1%BB%93ng.jpg', 250000, 2, N'Nước hoa hồng không chứa cồn có chiết xuất đến 90,89% tinh chất hoa hồng Bulgaria thay vì nước thường. Mà hoa hồng Mamonde dùng là loại hoa được trồng tại 1 vùng thung lũng thuộc Bulgaria, chiết xuất ở nhiệt độ thấp áp suất cao. Áp dụng phương pháp chiết xuất nước hoa hồng nhiệt độ thấp và áp suất cao giúp giảm thiểu tối đa chuyển đổi chất trong quá trình chiết xuất.', 6, 90)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (137, N'Toner AHA - BHA - PHA ', N'https://cf.shopee.vn/file/05e7b66ed6b4d63990e77d68a5ed69ef', 208000, 1, N'THÀNH PHẦN VÀ CÔNG DỤNG Nước Hoa Hồng Some By Mi AHA Toner
- Cây tràm trà giúp loại bỏ và ngăn ngừa những vết mụn, giảm nhỏ các lỗ chân lông, làm mịn da và dưỡng ẩm cho da.
- Cây hạt phỉ có chứa AHA tự nhiên giúp thu lỗ chân lông, tẩy tế bào chết và thay tầng da mới.
- Chiết xuất đu đủ có tác dụng loại bỏ bã nhờn và tế bào chết đồng thời giảm thâm nám.
- Chiết xuất đậu lăng giúp bảo vệ da, củng cố màng miễn dịch và cung cấp dinh dưỡng cho da.
- Chiết xuất tổ yến vàng có tác dụng chống oxy hóa, tái sinh tế bào giúp da săn chắc đàn hồi.
- Hoa sen giúp thanh lọc làn da, là dịu và đem lại độ cân bằng cho da.
- Ngoài những thành phần tự nhiên trên nước hoa hồng tràm trà của thương hiệu Some By Mi còn chứa bộ 3 thành phần tẩy da chết hóa học đình đám gồm: AHA, BHA và PHA.
- AHA – Alpha Hydroxy Acids là nhóm acid ưa nước, giúp liên kết các tế bào nên AHA phá vỡ liên kết nước này và làm bong phần da chết. Ngoài ra nó còn có khả năng chống lão hóa và săn chắc tầng biểu bì.
- BHA – Beta Hydroxy Acids có thể tan trong dầu nên tác động sâu giúp loại bỏ bụi bẩn, tế bào chết cứng đầu và làm thông thoáng lỗ chân lông, giảm nguy cơ gây ra mụn.
- PHA – Polyhydroxy Acids là nhóm acid lành tính nhất cũng có khả năng làm dịu da. Hơn thế, PHA còn chống oxy hóa, kích thích tế bào da tái tạo, giảm nếp nhăn và giúp da mặt khỏe, săn chắc hơn.
- Độ pH an toàn cho da không làm khô da và không gây kích ứng, tạo môi trường pH cân bằng cho da để da khỏe mạnh, hạn chế sự phát triển của vi khuẩn gây mụn.', 6, 100)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (138, N'Nước hoa hồng Thayer', N'https://congaiphaixinh.com/wp-content/uploads/2020/02/Review-nuoc-hoa-hong-thayers-witch-hazel-cucumber-Dep14-Thumb-1170x790-1.jpg', 270000, 3, N'Nước Hoa Hồng Không Cồn Hương Hoa Hồng Thayers Witch Hazel Rose Petal 355ml

Nước Hoa Hồng Không Cồn Hương Hoa Hồng Thayers Witch Hazel Rose Petal thuộc về thương hiệu Thayers - hãng mỹ phẩm có lịch sử lâu đời tại Mỹ. Toner Thayers là sản phẩm cực kì dịu nhẹ, được chiết xuất hoàn toàn từ nguồn nguyên liệu thiên nhiên như nước hoa hồng, chiết xuất cây phỉ, lô hội và vitamin E. Toner giúp đem lại cho bạn một làn da mềm mại, mịn màng mà không lo bị kích ứng. Toner với mùi hương hoa hồng thư thái.', 6, 250)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (139, N'Nước hoa hồng rau má ', N'https://product.hstatic.net/1000296801/product/tinh-chat-rau-ma-skin1004-madagascar-centella-asiatica-100-ampoule_2fddfce3881641098b4639428b1a0006.jpg', 268000, 2, N'Thương hiệu : Skin1004
Xuất xứ : Hàn Quốc
Dung tích : 210ml
Ngày Sản Xuất: xem trên bao bì sản phẩm
HSD: 2 năm kể từ ngày sản xuất 

Skin1004 Madagascar Centella Toning Toner với 84% chiết xuất rau má cùng thành phần PHA giúp tẩy tế bào chết cho da, chống viêm, làm dịu nhanh những tổn thương do mụn để lại.

Thành phần: 
Centella Asiatica Extract, Water, 1,2-Hexanediol, Dipropylene Glycol, Niacinamide, Gluconolactone, Tromethamine, Carbomer, Sodium Citrate, Adenosine, Disodium Edta, Dipotassium Glycyrrhizate, Betaine, Hyaluronic Acid, Ethylhexylglycerin', 6, 118)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (140, N'Toner La Roche Posay', N'https://totlaire.com/wp-content/uploads/2020/12/image-37.jpeg', 450000, 1, N'Nước hoa hồng La Roche-Posay Effaclar Astringent Lotion chính là một trong những sản phẩm không thể thiếu trong bộ sưu tập chăm sóc da của những cô nàng có làn da khỏe đẹp. Sở hữu những công dụng tuyệt vời nhờ vào những dưỡng chất ưu việt từ thiên nhiên, sản phẩm nước hoa hồng này sẽ khiến các nàng phải hài lòng khi sử dụng.

Nước hoa hồng La Roche-Posay Effaclar Lotion Astringent nằm trong bộ sản phẩm Effaclar dành cho da dầu, da mụn và nhạy cảm của thương hiệu La Roche-Posay.', 6, 220)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (141, N'KCN Innisfree', N'https://chiaki.vn/upload/news/content/2021/05/kem-chong-nang-vat-ly-innisfree-jpg-1620033907-03052021162507.jpg', 219000, 3, N'KEM CHỐNG NẮNG LÂU TRÔI LÀM SÁNG DA INNISFREE INTENSIVE TRIPLE CARE SUNSCREEN SPF50+ PA++++ 50ML

Chống nắng không phải là cách bạn chỉ dùng khẩu trang, mắt kính, bao tay, việc chống nắng không đúng hay tạm thời quên sẽ làm cho làn da chúng ta trở nên sạm hơn, lão hóa nhanh đi. Chính vì vậy, innisfree luôn quan tâm bảo vệ da bạn trước tác động của ánh nắng bất kể làn da của bạn có đang khó chiều thế nào. Kem chống nắng toàn diện lâu trôi 3 chức năng innisfree Perfect UV Protection Cream Triple Care SPF50+ PA++++ với kết cấu mỏng nhẹ, không gây bết dính, phù hợp cho các hoạt động ngoài trời.

THÔNG TIN SẢN PHẨM

Thành phần, công dụng
- Kem chống nắng toàn diện 3 chức năng: chống nắng, làm sáng và chống lão hoá
- Tác dụng chống thấm nước giúp bảo vệ da hiệu quả khỏi tia UV, thích hợp cho các hoạt động
ngoài trời hay tiếp xúc với nước.
- Kết cấu mềm mịn, không gây nhờn rít, không gây vệt trắng, giúp hiệu chỉnh tông màu da hiệu
quả.
- Chỉ số chống nắng SPF50+ PA++++
- Kem chống nắng vật lý', 2, 330)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (142, N'KCN Innisfree Tone Up', N'https://chiaki.vn/upload/news/content/2021/05/kem-chong-nang-vat-ly-innisfree-tone-up-jpg-1620353465-07052021091105.jpg', 340000, 2, N'Innisfree Tone Up No Sebum Sunscreen SPF50+/PA++++ dòng kem chống nắng 2-IN-1 thế hệ mới nhất, là sự kết hợp hoàn hảo giữa kem nền và kem chống nắng. Sản phẩm không chỉ mang lại hiệu quả chống nắng cao, nó còn có tác dụng làm trắng da, ngăn ngừa lão hóa da, giúp da ẩm mượt và căng bóng ngay sau khi sử dụng.

Không chỉ riêng Hàn Quốc, tại thị trường Việt Nam Innisfree Tone Up No Sebum Sunscreen SPF50+/PA++++ cũng đang là sản phẩm được ưa chuộng nhất, luôn trong tình trạng cháy hàng.', 2, 440)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (143, N'KCN Cell Fusion C', N'https://cf.shopee.vn/file/365fa13580c3d8ec537851695b6ad4f4', 375000, 4, N'Kem Chống Nắng Cell Fusion C Laser Sunscreen 100 SPF 50+/PA+++ là sản phẩm chống nắng vật lý dành cho da nhạy cảm, ít gây kích ứng bảo vệ làn da bị tổn thương bởi môi trường bên ngoài với tỷ lệ vàng của các bộ lọc UV vô cơ và hữu cơ. Kem giúp hỗ trợ ngăn ngừa lão hóa da do tia UV, khả năng chống tia cực tím không gây kích ứng hỗ trợ ngăn ngừa các dấu hiệu lão hóa lớn nhất, bao gồm cả sự xỉn màu và khô da. Bên cạnh đó, kem còn tăng cường độ đàn hồi cho da và giữ cho làn da khỏe mạnh.', 2, 500)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (144, N'KCN Obagi', N'https://a.ipricegroup.com/media/Mai_Nguyen/Obagi_Sun_Shield_Matte_Broad_Spectrum_SPF_50_Premium_nbsp_.jpg', 1026000, 1, N'Kem Chống Nắng Obagi Sun Shield Matte Broad Spectrum SPF 50 Premium là dòng mỹ phẩm cao cấp đến từ thương hiêu Obagi nổi tiếng của Mỹ. Kem chống nắng Obagi hỗ trợ bảo vệ da khỏi các bức xạ mặt trời.

Khác với bản thông thường, phiên bản Matte Premium có công thức thông minh thoáng nhẹ, hỗ trợ cải thiện da nhanh chóng hấp thu và để lại lớp nền mỏng, mờ, hỗ trợ làm giảm bóng nhờn. Bên cạnh đó kem chống nắng Obagi Sun Shield còn được bổ sung các thành phần hỗ trợ làm dịu da, hỗ trợ da mềm mại  tràn đầy sức sống, cùng Vitamin C& E hỗ trợ da tươi trẻ, săn chắc.', 2, 10)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (145, N'KCM EltaMD UV', N'https://lozimom.com/wp-content/uploads/2019/05/kem-chong-nang-elta-md-spf46-4.jpg', 830000, 2, N'Sản phẩm EltaMD UV Clear Broad-Spectrum SPF 46 giúp bảo vệ da trên diện rộng khỏi các tia UVA/UVB và chống lại ô nhiễm, giúp làm sáng làn da, giảm...

ĐẶC ĐIỂM NỔI BẬT:

EltaMD UV Clear Broad-Spectrum SPF 46 chứa niacinamide, acid hyaluronic và acid lactic, những dưỡng chất rất cần thiết cho việc nuôi dưỡng làn da khỏe mạnh. Đây là sản phẩm chuyên biệt cho da mụn nhạy cảm với thành phần hoàn toàn lành tính. Bên cạnh đó, EltaMD UV Clear Broad-Spectrum SPF 46 còn chứa zinc oxide giúp kiềm dầu, mang lại làn da khô thoáng suốt ngày dài.

Phức hợp hoạt chất chống nắng Zinc Oxide 9.0%​,​ Octinoxate 7.5% trong suốt được ổn định và tối ưu hóa hoạt tính trong dạng bào chế phù hợp cho hiệu quả kéo dài, chống UVB lẫn các tia UVA bước sóng ngắn và dài.

Sản phẩm chứa 5% tinh chất niacinamide (vitamin B3) nguyên chất giúp dưỡng trắng an toàn và hiệu quả, giúp điều tiết bã nhờn, làm se khít lỗ chân lông, cải thiện bề mặt da lão hóa, làm đều màu da, tái tạo cấu trúc bề mặt da sần sùi, giảm ửng đỏ và giữ ẩm, khiến da tươi trẻ, căng và mịn màng.

Bên cạnh đó, sản phẩm này còn có Tocopheryl Acetate​ (vitamin E) giúp giữ ẩm tốt và chống oxy hóa mạnh.', 2, 150)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (147, N'KCN Neutrogena SPF 70', N'http://cdn.tgdd.vn/Files/2021/12/14/1404461/review-top-10-kem-chong-nang-neutrogena-tot-nhat-hien-nay-202112160828007684.jpg', 300000, 3, N'Kem chống nắng Neutrogena Ultra Sheer SPF 70 của hãng Neutrogena sử dụng công nghệ độc quyền Helioplex Broad Spectrum UVA – UVB Protection, là công nghệ chống nắng phổ rộng, có khả năng tạo lớp hoạt chất bền vững, ổn định hơn trong việc ngăn ngừa tia UVA và UVB.

kem chống nắng Neutrogena Ultra Sheer Dry Touch SPF 70Sản phẩm đã được kiểm nghiệm khả nắng chống lại các tia UVA có khả năng gây tác hại bên dưới bề mặt da.
Chỉ số SPF 70 bảo vệ làn da hiệu quả

Kem chống nắng Neutrogena Ultra Sheer SPF 70 bảo vệ làn da bạn khỏi tác hại của ánh nắng mặt trời một cách hoàn hảo, nhất là ở môi trường nắng nóng như Việt Nam! Sản phẩm đã được kiểm nghiệm khả nắng chống lại các tia UVA có khả năng gây tác hại bên dưới bề mặt da. Đọc thêm về chỉ số SPF là gì – cách chọn SPF phù hợp với nhu cầu.', 2, 200)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (148, N'KCN Madagascar centella', N'https://media.hasaki.vn/wysiwyg/minhchau/kem-chong-nang-skin1004-chiet-xuat-rau-ma-spf50-pa-50ml-1.jpg', 260000, 1, N'Kem Chống Nắng Skin1004 Cho Da Nhạy Cảm 50ml là sản phẩm kem chống nắng đến từ thương hiệu mỹ phẩm Skin1004 của Hàn Quốc, là kem chống nắng vật lý với chiết xuất rau má và chất kem mỏng nhẹ có màu giúp che phủ nhẹ khuyết điểm cho da. Công thức đa năng vừa chống nắng vừa đều màu da lại dưỡng ẩm chính là sản phẩm mà những cô nàng da mụn hay da dầu nhạy cảm cần vì không cần sử dụng quá nhiều bước lỉnh kỉnh.', 2, 300)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (149, N'KCN Some by mi', N'https://bloganchoi.com/wp-content/uploads/2019/06/kem-chong-nang-tri-mun-va-duong-trang-da.jpg', 330000, 2, N'1. Thành phần:
Thành phần:
Với thành phần chống nắng là Zinc Oxide và Titanium Dioxide, đây là 2 thành phần rất an toàn, được khuyên dùng cho da mụn, nhạy cảm. Chỉ số chống nắng hoàn hảo SPF50+ PA++++, chỉ số chống nắng cao nhất tại Hàn Quốc, có khả năng chống tia UVA và UVB tốt.
Sản phẩm chứa tinh chất Tràm trà (Melaleuca Alternifolia Leaf Water) chứa đến 37,8% cùng hợp chất Truecica (tràm trà, ngải cứu, rau má) có tác dụng kháng khuẩn, hỗ trợ giảm mụn và làm dịu da mụn, ngăn ngừa mụn hiệu quả.
Thành phần Niacinamide giúp kích thích sản sinh Ceramide và Collagen, cải thiện tính đàn hồi cho da. Ngoài ra, thành phần này còn giúp ức chế melanin, cải thiện sắc tố da,  giúp da đều màu.
 2. Công dụng: 
- Chống lại tia UV gây hại cho da, bảo vệ da khỏi các tác nhân gây hại từ ánh nắng mặt trời và môi trường.
- Chỉ số chống nắng lí tưởng cho làn da của bạn.
- Làm dịu da mụn, ngăn ngừa và hỗ trợ giảm mụn ẩn, mụn viêm.
- Nâng tone đem lại lớp finish cho da sáng hơn.

3. Hướng dẫn sử dụng:
Ở bước cuối cùng của việc chăm sóc da, hãy thoa một lượng thích hợp (gợi ý 2ml một lần) lên mặt. bạn cũng có thể áp dụng một lượng thích hợp trên cổ, chân và cánh tay hoặc các bộ phận cơ thể khác dễ dàng tiếp xúc dưới tia UV.
4. Bảo quản: nơi khô ráo, thoáng mát, tránh ảnh nắng trực tiếp.
5. Ngày sản xuất: xem trên bao bì của sản phẩm.
6. Hạn sử dụng: 3 năm kể từ ngày sản xuất
7. Xuất xứ thương hiệu: Hàn Quốc
8. Nơi sản xuất: Hàn Quốc', 2, 400)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (151, N'KCN Australian Gold ', N'https://cf.shopee.vn/file/c26f184a0274002f94575b463e55c0cc_tn', 360000, 2, N'VỀ HÀNG EM KEM CHỐNG NẮNG HÓT HÒN HỌT NHÀ BOTANICAL
1. Fair to Light SPF 50 : phù hợp da trắng sáng. Chất kem thoa lên da có hiệu ứng trắng mờ, có thể làm BB Cream.
2. SPF 50 Tinted : phù hợp da sáng trung bình. Chất kem màu da, tệp màu da không nâng tone. Dòng này là best seller của hãng.
🌤🌤Australian Gold Botanical SPF 50 Tinted Face Sunscreen Lotion‼️
🇱🇷Đây cũng là 1 trong những brand mang danh xứ Australian được ưa chuộng rất nhiều ở US, không kém cạnh gì với Blue Lizard.
💦Khi thoa lên, chất kem lỏng nhẹ sẽ chuyển mịn lì tệp màu da, kiềm dầu và chống thấm nước rất hiệu quả nhưng lại không gây tắc nghẽn lỗ chân lông. Nên những nàng sợ kem lên tone trắng bệch thì tớ xin recommend ngay bạn í không đắn đo
👋 Ai thuộc team kem chống nắng vật lý thì không thể bỏ qua em này, cực kì phù hợp nếu mình không phải tiếp xúc với ánh nắng gay gắt thời gian dài như lúc đi làm, đi học ý. Ngoài ra em này có khả năng chống nước lên tới 80 phút, rất hợp lý khi mình đi bơi chẳng hạn 🌧
🧢 Bảng thành phần của em nó:
▪️Chứa 4% Zinc Oxide + 4% Titanium Dioxide: là hai thành phần chống UVA và UVB rất ổn định, duy trì được khả năng chống tia UV tốt. Vô cùng lành tính nên hay được dùng trong kem chống nắng trẻ em đó.
▪️Iron Oxides: hấp thụ quang phổ nhìn thấy được như ánh sáng xanh & bức xạ hồng ngoại.
▪️Chất chống oxy hoá mạnh mẽ từ chiết xuất thực vật: Mận Kakadu giàu Vitamin C, tảo đỏ chứa Vitamin A, Niacin, sắt, Folic Acid & 3 loại Amino Acids.
▪️Bơ hạt mỡ và Glycerin: dưỡng ẩm và cấp ẩm cho da.
🤷‍♀️ Một dòng kem chống nắng quá lý tưởng cho nàng là fan dòng vật lý thuần nhé 😘', 2, 30)
INSERT [dbo].[Product] ([Product_ID], [Name], [Image_URL], [Price], [Publisher_ID], [Detail], [Category_ID], [Quantity]) VALUES (152, N'KCN Bioderma Nude Touch', N'http://miraso.vn/upload/product/biodermaphotodermnudetouch2-4129.jpg', 360000, 3, N'Kem chống nắng Bioderma Photoderm Nude Touch với chỉ số chống nắng SPF 50 + chống tia UVA và UVB, 100% khoáng độc quyền Bioprotection Celullaire bảo vệ da, chống lại các hiệu ứng xấu tia tử ngoại trên da.

Kiểm soát lượng dầu tự nhiên của da ở mức lý tưởng, điều chỉnh cả tình trạng đổ dầu thừa và làm cho da ít đổ dầu hơn, với mùa hè bạn sẽ không cần phải dùng thêm kem dưỡng kiềm dầu nữa.

', 2, 50)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Publisher] ON 

INSERT [dbo].[Publisher] ([Publisher_ID], [Name]) VALUES (1, N'Nhà phân phối mỹ phẩm Thái Nguyên')
INSERT [dbo].[Publisher] ([Publisher_ID], [Name]) VALUES (2, N'Nhà phân phối mỹ phẩm nhập khẩu Hàn Quốc - VH')
INSERT [dbo].[Publisher] ([Publisher_ID], [Name]) VALUES (3, N'Nhà phân phối mỹ phẩm xách tay toàn quốc Maisa')
INSERT [dbo].[Publisher] ([Publisher_ID], [Name]) VALUES (4, N'Công ty TNHH mỹ phẩm Hoàn Mỹ')
SET IDENTITY_INSERT [dbo].[Publisher] OFF
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Account] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Account] ([User_ID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Account]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Product]
GO
ALTER TABLE [dbo].[Order_Line]  WITH CHECK ADD  CONSTRAINT [FK_Order_Line_Bill] FOREIGN KEY([Bill_ID])
REFERENCES [dbo].[Bill] ([Bill_ID])
GO
ALTER TABLE [dbo].[Order_Line] CHECK CONSTRAINT [FK_Order_Line_Bill]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Category] ([Category_ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Publisher] FOREIGN KEY([Publisher_ID])
REFERENCES [dbo].[Publisher] ([Publisher_ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Publisher]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Product]
GO
USE [master]
GO
ALTER DATABASE [QuanLyCosmetic] SET  READ_WRITE 
GO
