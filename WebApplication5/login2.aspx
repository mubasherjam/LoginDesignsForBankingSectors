<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login2.aspx.cs" Inherits="WebApplication5.login2" %>

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
            background: linear-gradient(135deg, #eef2f9 0%, #e4ebf7 55%, #dce6f5 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 24px;
            position: relative;
            overflow: hidden;
        }

        /* Soft decorative desk-scene shapes (abstract, no image assets needed) */
        .scene-shape {
            position: absolute;
            border-radius: 24px;
            background: linear-gradient(135deg, #4d7fd6, #3563b8);
            opacity: 0.9;
        }
        .shape-1 { width: 220px; height: 140px; top: 14%; left: 8%; transform: rotate(-6deg); opacity: 0.14; }
        .shape-2 { width: 140px; height: 140px; border-radius: 50%; bottom: 10%; left: 14%; background: #6fa1e8; opacity: 0.16; }
        .shape-3 { width: 90px; height: 90px; border-radius: 50%; top: 8%; right: 20%; background: #3563b8; opacity: 0.1; }
        .scene-clock {
            position: absolute;
            top: 10%; left: 42%;
            width: 70px; height: 70px;
            border-radius: 50%;
            border: 5px solid #3563b8;
            opacity: 0.15;
        }

        .page-wrap {
            width: 100%;
            max-width: 460px;
            position: relative;
            z-index: 2;
            animation: fadeIn 0.5s ease-in;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(14px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .brand-header { text-align: center; margin-bottom: 22px; }
        .brand-logo-text { font-size: 1.5rem; font-weight: 800; color: #16305e; letter-spacing: -0.01em; }
        .brand-logo-text .accent { color: #17a2b8; }
        .brand-sub {
            color: #7285a3; font-size: 0.78rem; font-weight: 600;
            letter-spacing: 0.06em; text-transform: uppercase; margin-top: 4px;
        }

        /* Floating card */
        .login-card {
            background: #ffffff;
            border-radius: 24px;
            padding: 0;
            box-shadow: 0 24px 60px rgba(22,48,94,0.16);
            overflow: hidden;
        }

        .card-top-strip {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 22px 28px;
            border-bottom: 1px solid #eef1f6;
        }
        .icon-badge {
            width: 44px; height: 44px;
            border-radius: 14px;
            background: linear-gradient(135deg, #4d7fd6, #16305e);
            display: flex; align-items: center; justify-content: center;
            color: #fff;
            font-size: 1.2rem;
            flex-shrink: 0;
        }
        .card-top-strip .title-text {
            font-weight: 800;
            color: #16305e;
            font-size: 1.05rem;
        }

        .card-body-area { padding: 28px 30px 32px 30px; }

        /* Error banner (shown conditionally) */
        .error-banner {
            background: #fdecec;
            border-left: 4px solid #e03131;
            color: #c92a2a;
            font-size: 0.8rem;
            font-weight: 700;
            padding: 9px 14px;
            border-radius: 8px;
            margin-bottom: 18px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .welcome-title {
            font-size: 1.4rem;
            font-weight: 800;
            color: #16305e;
            letter-spacing: -0.01em;
        }
        .welcome-sub {
            color: #8794aa;
            font-size: 0.88rem;
            margin-top: 3px;
            margin-bottom: 26px;
        }

        .form-group-wrap { margin-bottom: 18px; }
        .input-icon-group { position: relative; }
        .input-icon-group i {
            position: absolute; left: 15px; top: 50%;
            transform: translateY(-50%);
            color: #9aa5b8; font-size: 1rem; z-index: 2;
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
            border-color: #4d7fd6;
            background: #ffffff;
            box-shadow: 0 0 0 4px rgba(77,127,214,0.14);
        }
        .styled-input::placeholder { color: #9aa5b8; }

        .field-error-text {
            color: #e03131;
            font-size: 0.74rem;
            font-weight: 600;
            margin-top: 5px;
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .login-btn {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 12px;
            background: linear-gradient(135deg, #4d7fd6, #16305e);
            color: #fff;
            font-weight: 700;
            font-size: 0.98rem;
            letter-spacing: 0.02em;
            margin-top: 6px;
            display: flex; align-items: center; justify-content: center; gap: 8px;
            transition: all 0.15s ease;
            cursor: pointer;
        }
        .login-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 12px 26px rgba(22,48,94,0.3);
        }

        .card-bottom-links {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }
        .card-bottom-links a {
            color: #4d7fd6;
            font-size: 0.83rem;
            font-weight: 600;
            text-decoration: none;
        }
        .card-bottom-links a:hover { color: #16305e; }
        .card-bottom-links span.sep { color: #d7dde5; font-size: 0.83rem; }

        .footer-note {
            text-align: center; margin-top: 24px;
            color: #8794aa; font-size: 0.78rem;
        }

        @media (max-width: 480px) {
            .card-body-area { padding: 24px 22px 28px 22px; }
            .card-top-strip { padding: 18px 22px; }
        }
    </style>
</head>
<body>

    <!-- Decorative background shapes (desk-scene inspired, abstract) -->
    <div class="scene-shape shape-1"></div>
    <div class="scene-shape shape-2"></div>
    <div class="scene-shape shape-3"></div>
    <div class="scene-clock"></div>

    <form id="form1" runat="server">
    <div class="page-wrap">

        <div class="brand-header">
            <div class="brand-logo-text">AutoSoft<span class="accent">Dynamics</span></div>
            <div class="brand-sub">ABC Bank &middot; Dashboard Login</div>
        </div>

        <div class="login-card">

            <div class="card-top-strip">
                <div class="icon-badge"><i class="bi bi-speedometer2"></i></div>
                <div class="title-text">Dashboard Login</div>
            </div>

            <div class="card-body-area">

                <!-- Error banner - toggle Visible="true" server-side when login fails -->
                <asp:Panel ID="pnlError" runat="server" CssClass="error-banner" Visible="false">
                    <i class="bi bi-exclamation-circle-fill"></i>
                    <asp:Literal ID="litErrorText" runat="server" Text="Wrong Password!!" />
                </asp:Panel>

                <div class="welcome-title">Welcome Back</div>
                <div class="welcome-sub">Give your best report today!</div>

                <div class="form-group-wrap">
                    <div class="input-icon-group">
                        <i class="bi bi-person"></i>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="styled-input" placeholder="Username" />
                    </div>
                    <!-- Example inline field error - toggle Visible server-side as needed -->
                    <asp:Label ID="lblUsernameError" runat="server" CssClass="field-error-text" Visible="false">
                        <i class="bi bi-info-circle-fill"></i> Username field cannot be empty
                    </asp:Label>
                </div>

                <div class="form-group-wrap">
                    <div class="input-icon-group">
                        <i class="bi bi-lock"></i>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="styled-input" TextMode="Password" placeholder="Password" />
                    </div>
                </div>

                <asp:Button ID="btnLogin" runat="server" CssClass="login-btn" Text="→  Login to My Account" />

                <div class="card-bottom-links">
                    <a href="#">Forgot Password?</a>
                    <span class="sep">|</span>
                    <a href="#">Need Help?</a>
                </div>

            </div>
        </div>

        <div class="footer-note">
            &copy; AutoSoft Dynamics &middot; Secure Banking Portal
        </div>

    </div>
    </form>
</body>
</html>