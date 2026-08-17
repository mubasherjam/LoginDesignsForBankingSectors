<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login3.aspx.cs" Inherits="WebApplication5.login3" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AutoSoft Dynamics | ABC Bank Login</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" />

    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif; }

        html, body { height: 100%; }

        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #0a1a3a, #0d2149, #16305e, #0d2149);
            background-size: 300% 300%;
            animation: gradientShift 14s ease infinite;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 24px;
            position: relative;
            overflow: hidden;
        }

        @keyframes gradientShift {
            0%   { background-position: 0% 50%; }
            50%  { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Floating animated orbs */
        .orb {
            position: absolute;
            border-radius: 50%;
            filter: blur(2px);
            pointer-events: none;
        }
        .orb-1 {
            width: 340px; height: 340px;
            background: radial-gradient(circle, rgba(45,212,191,0.22), transparent 70%);
            top: -120px; left: -100px;
            animation: floatSlow 9s ease-in-out infinite;
        }
        .orb-2 {
            width: 260px; height: 260px;
            background: radial-gradient(circle, rgba(77,127,214,0.25), transparent 70%);
            bottom: -100px; right: -80px;
            animation: floatSlow 11s ease-in-out infinite reverse;
        }
        .orb-3 {
            width: 140px; height: 140px;
            background: radial-gradient(circle, rgba(45,212,191,0.18), transparent 70%);
            top: 20%; right: 12%;
            animation: floatSlow 7s ease-in-out infinite;
        }
        @keyframes floatSlow {
            0%, 100% { transform: translateY(0) translateX(0); }
            50% { transform: translateY(-30px) translateX(20px); }
        }

        /* Subtle grid texture overlay */
        .grid-overlay {
            position: absolute; inset: 0;
            background-image:
                linear-gradient(rgba(255,255,255,0.025) 1px, transparent 1px),
                linear-gradient(90deg, rgba(255,255,255,0.025) 1px, transparent 1px);
            background-size: 44px 44px;
            pointer-events: none;
        }

        .page-wrap {
            width: 100%;
            max-width: 430px;
            position: relative;
            z-index: 3;
        }

        /* Entrance animations, staggered */
        .anim-in {
            opacity: 0;
            transform: translateY(22px);
            animation: riseIn 0.6s cubic-bezier(0.22, 1, 0.36, 1) forwards;
        }
        .delay-1 { animation-delay: 0.05s; }
        .delay-2 { animation-delay: 0.18s; }
        .delay-3 { animation-delay: 0.30s; }
        @keyframes riseIn {
            to { opacity: 1; transform: translateY(0); }
        }

        .brand-header { text-align: center; margin-bottom: 26px; }
        .brand-logo-icon {
            width: 56px; height: 56px;
            border-radius: 16px;
            background: linear-gradient(135deg, #2dd4bf, #17a2b8);
            display: flex; align-items: center; justify-content: center;
            color: #0d2149;
            font-size: 1.5rem;
            margin: 0 auto 14px auto;
            box-shadow: 0 10px 30px rgba(45,212,191,0.35);
            animation: pulseGlow 3s ease-in-out infinite;
        }
        @keyframes pulseGlow {
            0%, 100% { box-shadow: 0 10px 30px rgba(45,212,191,0.35); }
            50% { box-shadow: 0 10px 42px rgba(45,212,191,0.55); }
        }
        .brand-logo-text { font-size: 1.55rem; font-weight: 800; color: #fff; letter-spacing: -0.01em; }
        .brand-logo-text .accent { color: #2dd4bf; }
        .brand-sub {
            color: rgba(255,255,255,0.5); font-size: 0.78rem; font-weight: 600;
            letter-spacing: 0.08em; text-transform: uppercase; margin-top: 5px;
        }

        /* Glassmorphism card */
        .login-card {
            background: rgba(255,255,255,0.08);
            backdrop-filter: blur(24px) saturate(160%);
            -webkit-backdrop-filter: blur(24px) saturate(160%);
            border: 1px solid rgba(255,255,255,0.14);
            border-radius: 26px;
            padding: 38px 34px 32px 34px;
            box-shadow: 0 30px 70px rgba(0,0,0,0.4);
        }

        .card-title { font-size: 1.5rem; font-weight: 800; color: #fff; margin-bottom: 4px; }
        .card-subtitle { color: rgba(255,255,255,0.55); font-size: 0.87rem; margin-bottom: 28px; }

        /* Floating-label inputs */
        .float-group {
            position: relative;
            margin-bottom: 22px;
        }
        .float-group i.field-icon {
            position: absolute; left: 16px; top: 17px;
            color: rgba(255,255,255,0.4);
            font-size: 1.05rem;
            z-index: 3;
            transition: color 0.2s ease;
        }
        .float-input {
            width: 100%;
            padding: 20px 16px 8px 44px;
            border-radius: 14px;
            border: 1.5px solid rgba(255,255,255,0.16);
            background: rgba(255,255,255,0.06);
            color: #fff;
            font-size: 0.96rem;
            transition: all 0.2s ease;
            position: relative;
            z-index: 2;
        }
        .float-input::placeholder { color: transparent; }
        .float-input:focus {
            outline: none;
            border-color: #2dd4bf;
            background: rgba(255,255,255,0.1);
            box-shadow: 0 0 0 4px rgba(45,212,191,0.15);
        }
        .float-input:focus ~ i.field-icon { color: #2dd4bf; }

        .float-label {
            position: absolute;
            left: 44px; top: 15px;
            color: rgba(255,255,255,0.45);
            font-size: 0.95rem;
            pointer-events: none;
            transition: all 0.18s ease;
            z-index: 3;
        }
        .float-input:focus ~ .float-label,
        .float-input:not(:placeholder-shown) ~ .float-label {
            top: 6px;
            left: 44px;
            font-size: 0.68rem;
            font-weight: 700;
            color: #2dd4bf;
            letter-spacing: 0.03em;
        }

        .toggle-password {
            position: absolute; right: 16px; top: 17px;
            color: rgba(255,255,255,0.4);
            cursor: pointer;
            z-index: 3;
            font-size: 1rem;
            transition: color 0.15s ease;
        }
        .toggle-password:hover { color: #2dd4bf; }

        .form-extras {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 26px;
            font-size: 0.82rem;
        }
        .remember-check {
            display: flex; align-items: center; gap: 7px;
            color: rgba(255,255,255,0.6);
        }
        .remember-check input { accent-color: #2dd4bf; width: 15px; height: 15px; cursor: pointer; }
        .forgot-link { color: #2dd4bf; text-decoration: none; font-weight: 600; }
        .forgot-link:hover { color: #6fe8d8; }

        /* Button with shine sweep effect */
        .login-btn {
            width: 100%;
            padding: 15px;
            border: none;
            border-radius: 14px;
            background: linear-gradient(135deg, #2dd4bf, #17a2b8);
            color: #0d2149;
            font-weight: 800;
            font-size: 0.98rem;
            letter-spacing: 0.02em;
            position: relative;
            overflow: hidden;
            cursor: pointer;
            transition: transform 0.15s ease, box-shadow 0.15s ease;
        }
        .login-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 14px 32px rgba(45,212,191,0.4);
        }
        .login-btn::before {
            content: '';
            position: absolute;
            top: 0; left: -75%;
            width: 50%; height: 100%;
            background: linear-gradient(120deg, transparent, rgba(255,255,255,0.5), transparent);
            transform: skewX(-20deg);
            transition: left 0.6s ease;
        }
        .login-btn:hover::before { left: 130%; }

        .divider-row {
            display: flex; align-items: center; gap: 12px;
            margin: 22px 0 18px 0;
        }
        .divider-row .line { flex: 1; height: 1px; background: rgba(255,255,255,0.15); }
        .divider-row span { color: rgba(255,255,255,0.4); font-size: 0.75rem; font-weight: 600; }

        .signup-row {
            text-align: center;
            color: rgba(255,255,255,0.55);
            font-size: 0.86rem;
        }
        .signup-row a { color: #2dd4bf; font-weight: 700; text-decoration: none; }
        .signup-row a:hover { color: #6fe8d8; }

        .footer-note {
            text-align: center; margin-top: 24px;
            color: rgba(255,255,255,0.35); font-size: 0.76rem;
        }

        @media (max-width: 480px) {
            .login-card { padding: 30px 24px 26px 24px; }
        }
    </style>
</head>
<body>

    <div class="orb orb-1"></div>
    <div class="orb orb-2"></div>
    <div class="orb orb-3"></div>
    <div class="grid-overlay"></div>

    <form id="form1" runat="server">
    <div class="page-wrap">

        <div class="brand-header anim-in delay-1">
            <div class="brand-logo-icon"><i class="bi bi-shield-lock-fill"></i></div>
            <div class="brand-logo-text">AutoSoft<span class="accent">Dynamics</span></div>
            <div class="brand-sub">ABC Bank Secure Portal</div>
        </div>

        <div class="login-card anim-in delay-2">

            <div class="card-title">Welcome back</div>
            <div class="card-subtitle">Sign in to access your dashboard</div>

            <div class="float-group">
                <i class="bi bi-person field-icon"></i>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="float-input" placeholder=" " />
                <label class="float-label">User ID</label>
            </div>

            <div class="float-group">
                <i class="bi bi-lock field-icon"></i>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="float-input" TextMode="Password" placeholder=" " />
                <label class="float-label">Password</label>
                <i class="bi bi-eye toggle-password" id="togglePwdIcon" onclick="togglePasswordVisibility()"></i>
            </div>

            <div class="form-extras">
                <label class="remember-check">
                    <input type="checkbox" id="chkRemember" />
                    Remember me
                </label>
                <a href="#" class="forgot-link">Forgot password?</a>
            </div>

            <asp:Button ID="btnLogin" runat="server" CssClass="login-btn" Text="Sign In" />

            <div class="divider-row">
                <div class="line"></div>
                <span>NEED HELP</span>
                <div class="line"></div>
            </div>

            <div class="signup-row">
                Trouble logging in? <a href="#">Contact support</a>
            </div>

        </div>

        <div class="footer-note anim-in delay-3">
            &copy; AutoSoft Dynamics &middot; All rights reserved
        </div>

    </div>
    </form>

    <script>
        function togglePasswordVisibility() {
            var pwdInput = document.querySelector('.float-input[type="password"], .float-input[type="text"]#pwdField');
            var pwdField = document.getElementById('<%= txtPassword.ClientID %>');
            var icon = document.getElementById('togglePwdIcon');

            if (pwdField.type === 'password') {
                pwdField.type = 'text';
                icon.classList.remove('bi-eye');
                icon.classList.add('bi-eye-slash');
            } else {
                pwdField.type = 'password';
                icon.classList.remove('bi-eye-slash');
                icon.classList.add('bi-eye');
            }
        }
    </script>
</body>
</html>