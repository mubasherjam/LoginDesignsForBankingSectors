<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication5.login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AutoSoft Dynamics | ABC Bank Login</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" />

    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif; }

        body {
            min-height: 100vh;
            background: linear-gradient(160deg, #0d2149 0%, #16305e 45%, #1a3a6e 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 24px;
            position: relative;
            overflow: hidden;
        }

        /* Decorative background shapes */
        body::before, body::after {
            content: '';
            position: absolute;
            border-radius: 50%;
            background: rgba(255,255,255,0.04);
        }
        body::before { width: 480px; height: 480px; top: -180px; left: -160px; }
        body::after { width: 320px; height: 320px; bottom: -140px; right: -100px; background: rgba(23,162,184,0.08); }

        .login-shell {
            width: 100%;
            max-width: 420px;
            position: relative;
            z-index: 2;
            animation: fadeIn 0.5s ease-in;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(14px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Brand header, outside the card */
        .brand-header {
            text-align: center;
            margin-bottom: 24px;
        }
        .brand-logo-text {
            font-size: 1.6rem;
            font-weight: 800;
            color: #ffffff;
            letter-spacing: -0.01em;
        }
        .brand-logo-text .accent { color: #2dd4bf; }
        .brand-sub {
            color: rgba(255,255,255,0.55);
            font-size: 0.8rem;
            font-weight: 500;
            letter-spacing: 0.06em;
            text-transform: uppercase;
            margin-top: 4px;
        }
        .brand-divider {
            width: 46px;
            height: 3px;
            background: #2dd4bf;
            border-radius: 3px;
            margin: 14px auto 0 auto;
        }

        /* The card itself */
        .login-card {
            background: #ffffff;
            border-radius: 22px;
            padding: 40px 36px 34px 36px;
            box-shadow: 0 30px 70px rgba(0,0,0,0.35);
        }

        .avatar-wrap {
            display: flex;
            justify-content: center;
            margin-bottom: 24px;
        }
        .avatar-circle {
            width: 84px; height: 84px;
            border-radius: 50%;
            background: linear-gradient(135deg, #16305e, #0d2149);
            display: flex; align-items: center; justify-content: center;
            color: #fff;
            font-size: 2.1rem;
            box-shadow: 0 10px 24px rgba(13,33,73,0.3);
            border: 4px solid #eef2f8;
        }

        .form-label {
            font-size: 0.8rem;
            font-weight: 700;
            color: #16305e;
            margin-bottom: 6px;
            display: block;
            letter-spacing: 0.02em;
        }

        .input-icon-group {
            position: relative;
            margin-bottom: 20px;
        }
        .input-icon-group i {
            position: absolute;
            left: 15px; top: 50%;
            transform: translateY(-50%);
            color: #9aa5b8;
            font-size: 1rem;
            z-index: 2;
        }
        .styled-input {
            width: 100%;
            padding: 13px 16px 13px 42px;
            border-radius: 12px;
            border: 1.5px solid #e2e7f0;
            background: #f8f9fc;
            font-size: 0.95rem;
            color: #16305e;
            transition: all 0.15s ease;
        }
        .styled-input:focus {
            outline: none;
            border-color: #2dd4bf;
            background: #ffffff;
            box-shadow: 0 0 0 4px rgba(45,212,191,0.15);
        }
        .styled-input::placeholder { color: #9aa5b8; }

        .login-btn {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 12px;
            background: linear-gradient(135deg, #17a2b8, #0f7d90);
            color: #fff;
            font-weight: 700;
            font-size: 0.98rem;
            letter-spacing: 0.02em;
            margin-top: 6px;
            transition: all 0.15s ease;
            cursor: pointer;
        }
        .login-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 10px 24px rgba(23,162,184,0.35);
            background: linear-gradient(135deg, #1cb4cc, #128a9f);
        }

        .login-links {
            display: flex;
            justify-content: center;
            gap: 22px;
            margin-top: 22px;
        }
        .login-links a {
            color: #16305e;
            font-size: 0.83rem;
            font-weight: 600;
            text-decoration: none;
            position: relative;
        }
        .login-links a:hover { color: #17a2b8; }
        .login-links span.sep { color: #d7dde5; font-size: 0.83rem; }

        .footer-note {
            text-align: center;
            margin-top: 26px;
            color: rgba(255,255,255,0.4);
            font-size: 0.78rem;
        }

        @media (max-width: 480px) {
            .login-card { padding: 32px 24px 28px 24px; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="login-shell">

        <div class="brand-header">
            <div class="brand-logo-text">AutoSoft<span class="accent">Dynamics</span></div>
            <div class="brand-sub">ABC Bank</div>
            <div class="brand-divider"></div>
        </div>

        <div class="login-card">

            <div class="avatar-wrap">
                <div class="avatar-circle">
                    <i class="bi bi-person-fill"></i>
                </div>
            </div>

            <div class="mb-1">
                <label class="form-label">User ID</label>
                <div class="input-icon-group">
                    <i class="bi bi-person"></i>
                    <asp:TextBox ID="txtUserID" runat="server" CssClass="styled-input" placeholder="Enter your User ID" />
                </div>
            </div>

            <div class="mb-1">
                <label class="form-label">Password</label>
                <div class="input-icon-group">
                    <i class="bi bi-lock"></i>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="styled-input" TextMode="Password" placeholder="Enter your password" />
                </div>
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="Log In" CssClass="login-btn" />

            <div class="login-links">
                <a href="#">Forgot Password?</a>
                <span class="sep">|</span>
                <a href="#">How to Login</a>
            </div>

        </div>

        <div class="footer-note">
            &copy; AutoSoft Dynamics &middot; Secure Banking Portal
        </div>

    </div>
    </form>
</body>
</html>