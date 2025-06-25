# 💰 Expense Tracker - Java Web Application

A Java-based web application to manage and track personal expenses with user authentication and categorized transaction tracking.

---

## 🚀 Features
- User registration and login (JSP + Servlets)
- Add, view, edit, and delete expenses
- Categorize expenses (Food, Transport, etc.)
- Real-time updates and monthly summaries
- MySQL database integration

---

## 🛠️ Technologies Used
- Java (JSP & Servlets)
- HTML, CSS
- MySQL
- JDBC
- Eclipse IDE

---

## 📂 Project Structure
```
ExpenseTracker/
├── src/
│   └── in/ay/controller/
│       └── Register.java
│       └── Login.java
│       └── AddExpense.java
├── WebContent/
│   ├── login.html
│   ├── register.html
│   ├── home.jsp
│   └── expenses.jsp
└── WEB-INF/
    └── web.xml
```

---

## 🧪 Setup Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/Anurag8402/expense-tracker.git
   ```
2. Import into Eclipse as a Dynamic Web Project
3. Create MySQL database and tables:
   ```sql
   CREATE DATABASE expense_db;

   CREATE TABLE users (
       id INT PRIMARY KEY AUTO_INCREMENT,
       name VARCHAR(100),
       email VARCHAR(100),
       password VARCHAR(100)
   );

   CREATE TABLE expenses (
       id INT PRIMARY KEY AUTO_INCREMENT,
       user_id INT,
       category VARCHAR(100),
       amount DECIMAL(10,2),
       date DATE,
       FOREIGN KEY (user_id) REFERENCES users(id)
   );
   ```
4. Configure DB credentials in your Java code (DBconnection.java)
5. Run on Apache Tomcat

---

## 👨‍💻 Author
**Anurag Yadav**  
[GitHub Profile](https://github.com/Anurag8402)

---

## 📄 License
This project is licensed under the MIT License.


