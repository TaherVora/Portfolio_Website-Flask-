-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2022 at 07:17 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codingthunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone_num` int(12) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `phone_num`, `msg`, `date`, `email`) VALUES
(1, 'first_name', 1234567890, 'first_message', '2022-02-01 21:43:06', 'firstpost@gmail.com'),
(2, 'Taher', 1212121212, 'It should work fine.', NULL, 'vora@gmail.com'),
(3, 'Taher Murtuza Vora', 2147483647, 'Chal ja mere bhai', '2022-02-01 22:12:18', 'TaherMurtuza.Vora01@student.csulb.edu'),
(4, 'ALMEE CHRISTIAN', 2147483647, 'HVCYASGCukAYCJASVCJKYG', '2022-02-02 16:39:37', 'almee6198@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(12) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'Lets learn about stock market in detail', 'This is first post', 'first-post', 'In finance, stock (also capital and  non capital stock) consists of all of the shares into which ownership of a corporation or company is divided.[1] (Especially in American English, the word \"stocks\" is also used to refer to shares.)[1][2] A single share of the stock means fractional ownership of the corporation in proportion to the total number of shares. This typically entitles the shareholder (stockholder) to that fraction of the company\'s earnings, proceeds from liquidation of assets (after discharge of all senior claims such as secured and unsecured debt),[3] or voting power, often dividing these up in proportion to the amount of money each stockholder has invested. Not all stock is necessarily equal, as certain classes of stock may be issued for example without voting rights, with enhanced voting rights, or with a certain priority to receive profits or liquidation proceeds before or after other classes of shareholders.', 'post-bg.jpg', '2022-02-09 16:00:03'),
(2, 'About Jinja', 'This is second post', 'second-post', 'The most powerful part of Jinja is template inheritance. Template inheritance allows you to build a base \"skeleton\" template that contains all the common elements of your site and defines blocks that child templates can override.', '', '2022-02-04 12:40:45'),
(3, 'Simple Relationships are complicated', 'This is third post', 'third-post', 'SQLAlchemy connects to relational databases and what relational databases are really good at are relations. As such, we shall have an example of an application that uses two tables that have a relationship to each other:\r\n\r\nfrom datetime import datetime\r\n\r\n\r\nclass Post(db.Model):\r\n    id = db.Column(db.Integer, primary_key=True)\r\n    title = db.Column(db.String(80), nullable=False)\r\n    body = db.Column(db.Text, nullable=False)\r\n    pub_date = db.Column(db.DateTime, nullable=False,\r\n        default=datetime.utcnow)\r\n\r\n    category_id = db.Column(db.Integer, db.ForeignKey(\'category.id\'),\r\n        nullable=False)\r\n    category = db.relationship(\'Category\',\r\n        backref=db.backref(\'posts\', lazy=True))\r\n\r\n    def __repr__(self):\r\n        return \'<Post %r>\' % self.title\r\n\r\n\r\nclass Category(db.Model):\r\n    id = db.Column(db.Integer, primary_key=True)\r\n    name = db.Column(db.String(50), nullable=False)\r\n\r\n    def __repr__(self):\r\n        return \'<Category %r>\' % self.name\r\nFirst let’s create some objects:\r\n\r\n>>> py = Category(name=\'Python\')\r\n>>> Post(title=\'Hello Python!\', body=\'Python is pretty cool\', category=py)\r\n>>> p = Post(title=\'Snakes\', body=\'Ssssssss\')\r\n>>> py.posts.append(p)\r\n>>> db.session.add(py)\r\nAs you can see, there is no need to add the Post objects to the session. Since the Category is part of the session all objects associated with it through relationships will be added too. It does not matter whether db.session.add() is called before or after creating these objects. The association can also be done on either side of the relationship - so a post can be created with a category or it can be added to the list of posts of the category.\r\n\r\nLet’s look at the posts. Accessing them will load them from the database since the relationship is lazy-loaded, but you will probably not notice the difference - loading a list is quite fast:\r\n\r\n>>> py.posts\r\n[<Post \'Hello Python!\'>, <Post \'Snakes\'>]\r\nWhile lazy-loading a relationship is fast, it can easily become a major bottleneck when you end up triggering extra queries in a loop for more than a few objects. For this case, SQLAlchemy lets you override the loading strategy on the query level. If you wanted a single query to load all categories and their posts, you could do it like this:\r\n\r\n>>> from sqlalchemy.orm import joinedload\r\n>>> query = Category.query.options(joinedload(\'posts\'))\r\n>>> for category in query:\r\n...     print category, category.posts\r\n<Category u\'Python\'> [<Post u\'Hello Python!\'>, <Post u\'Snakes\'>]\r\nIf you want to get a query object for that relationship, you can do so using with_parent(). Let’s exclude that post about Snakes for example:\r\n\r\n>>> Post.query.with_parent(py).filter(Post.title != \'Snakes\').all()\r\n[<Post \'Hello Python!\'>]', '', '2022-02-09 16:28:03'),
(4, 'Road to Enlightenment', 'This is fourth post', 'fourth-post', 'The only things you need to know compared to plain SQLAlchemy are:\r\n\r\nSQLAlchemy gives you access to the following things:\r\n\r\nall the functions and classes from sqlalchemy and sqlalchemy.orm\r\n\r\na preconfigured scoped session called session\r\n\r\nthe metadata\r\n\r\nthe engine\r\n\r\na SQLAlchemy.create_all() and SQLAlchemy.drop_all() methods to create and drop tables according to the models.\r\n\r\na Model baseclass that is a configured declarative base.\r\n\r\nThe Model declarative base class behaves like a regular Python class but has a query attribute attached that can be used to query the model. (Model and BaseQuery)\r\n\r\nYou have to commit the session, but you don’t have to remove it at the end of the request, Flask-SQLAlchemy does that for you.', '', '2022-02-04 13:30:24'),
(5, 'Quickstart', 'This is fifth post', 'fifth-post', 'Flask-SQLAlchemy is fun to use, incredibly easy for basic applications, and readily extends for larger applications. For the complete guide, checkout the API documentation on the SQLAlchemy class.\r\n\r\nInstallation\r\nInstall and update using pip:\r\n\r\n$ pip install -U Flask-SQLAlchemy', '', '2022-02-04 13:32:49'),
(6, 'title6', 'This is sixth post', 'sixth-post', 'For the common case of having one Flask application all you have to do is to create your Flask application, load the configuration of choice and then create the SQLAlchemy object by passing it the application.\r\n\r\nOnce created, that object then contains all the functions and helpers from both sqlalchemy and sqlalchemy.orm. Furthermore it provides a class called Model that is a declarative base which can be used to declare models:\r\n\r\nfrom flask import Flask\r\nfrom flask_sqlalchemy import SQLAlchemy\r\n\r\napp = Flask(__name__)\r\napp.config[\'SQLALCHEMY_DATABASE_URI\'] = \'sqlite:////tmp/test.db\'\r\ndb = SQLAlchemy(app)\r\n\r\n\r\nclass User(db.Model):\r\n    id = db.Column(db.Integer, primary_key=True)\r\n    username = db.Column(db.String(80), unique=True, nullable=False)\r\n    email = db.Column(db.String(120), unique=True, nullable=False)\r\n\r\n    def __repr__(self):\r\n        return \'<User %r>\' % self.username', '', '2022-02-04 13:32:49'),
(7, 'HELLO', 'MY NAME ', 'is', 'TAHER', 'img.png', '2022-02-09 16:27:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
