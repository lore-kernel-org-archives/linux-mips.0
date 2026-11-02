Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661171;
	b=XQd55UB/z0Wz3MdoWEBZXXKofBDZLMmsU66HxnS8z/EFM9XrmiGQ/+PbUbCoPRqrvb+y
	 9WKVqnp36mz7JyfY7jx+uK9sjztxJicUKQuzVQM0rhe9lxV8nTfJJeB1LBYD3ePfmcX0U
	 trZSMqsPZOV655vOkmnjwakwPYkZDo4U3TmvAnXGMkWjPtr+QxI/hE5Xb64TgucxaMS92
	 i84Sw2eYWeEvWwHYsXMgQhhoYBq1Sm2C/jhvYTqaAMSuEcI+7tbkRveQ12z3TCA3YlrCG
	 42ycMHknoKzTc/6H0lHVvhpGsKn47+iBiM92mORQJOt7PGIZa256Y34iKhIlsK+SNhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=EamzdbmCJd/tsLqc1Uf5xYkgzwxHOHLxwnt7C9IRutQ=;
	b=qEUqHFeyUNINJJTXC7mYz75cWs6nRWxdIQg90Q3lnu6Pf/DJh/AHHfl0WWPlae7nYXDl
	 pYVyTSBG+N0vfuy6BsaQ6WtEUkuG5DgmGMnTzzA95GegtTrBfKk1zLmYoCgR6beFfSLCV
	 dSgmaffsvOMlwI8QK/qG93K4AcdOrx0qAjpTB9OG8sWX8/v97YcDxwGqMfdLMljyWpdrD
	 pGJ0lC2O66TfRSOLcJ8oSS677NLD2c4fDJf++pjbIBVBNAH8+dSiLMJgggpPGEGLRzQNA
	 MpavTKlv2yql21kPFLhwaUtwJAZsQO71ig3Ife+bVtz9GwbhmJo3QlqNIKtZnP8ZwwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="rx8b/Fy+";
	arc=none smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8AD606A32D
	for <linux-mips@vger.kernel.org>; Mon,  2 Nov 2026 23:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C8AD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rx8b/Fy+
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-679334baa1fso3871161d50.2
        for <linux-mips@vger.kernel.org>; Mon, 02 Nov 2026 15:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1793661170; x=1794265970; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EamzdbmCJd/tsLqc1Uf5xYkgzwxHOHLxwnt7C9IRutQ=;
        b=rx8b/Fy+NjWKy9Kt9BkYBTAgAdfsrCjtSJw8M4hgKdPwSbdNWSPDWS+qzcv7PpS2X0
         5GpXVRoxUaZ06rvZROEMQEK8Mttmw9rGPzF93KOiP9W3KhIAYixd7e7GNOgC4Fr334R+
         ZMd7FukI1GTj1DTuhU9+GULRf5Xbb/LNWXhyf+MMw2FwhCJ82Zi4Ko0jgs9VZCKtAS5x
         oaNuyuW9O/UX3/pzgRC6JwSMVmrAnNCPfmYE8DdZzfw6boqxFs9vrYo7Ge/Mx04wtHt3
         oH7W5UO7A+o2/swON24J9mUTxAOGRp+JLyPEKuWH7Od/aF95WucAzIhYr4/n/eokeaGH
         ubDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661170; x=1794265970;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EamzdbmCJd/tsLqc1Uf5xYkgzwxHOHLxwnt7C9IRutQ=;
        b=wXUkwEBxdzjxlTQ/yjEdKFX3dIzsjS5/8SJi+RRVt6cHo88mWX1Pu4t5NvqLSUIqiR
         0Kmuxb6SvTPIII809L2Eg3qfiW+KZFXH4z9AIkL3uM6uLzj04NLDzDGAPMnROu6USMxm
         pBd+d0W0EG4BNFrB4pM9Q65cAFjczHqgN3cHSvGYSho2jfZUGuMAdCWVauaOrgKM1+rN
         QYMYpxDNbmghCBAuD12fga5j3KFbY3ie2XG39F484lvX4tzjLzoqdLttyTFfu0oV3g9Z
         4zEqJnen9yZDOaiQzjGAzC8dQSQKFI1Hwa4QTU3vqPFOAuYh7Jpk5092AHnl397cGzAD
         kgnw==
X-Forwarded-Encrypted: i=1; AKwUvByfDQMEqO8XDwyNRew3msueWEMtfDbghkR2apIlZgsaVXGYUO+i9cGoy+ZR82wDIm1zdZTuudjP2KO0@vger.kernel.org
X-Gm-Message-State: APuU4Z+/ey+Hrvh5umoeqebWiPbx4muGKeBGHtGiprRhkMkRbNne0A0T
	VBTovIqB9+EykPOBGQCwCNvsx+GDrAIg8iJMq/SYfpzSkHunmBjum9bKF5JpntAwRMjt
X-Gm-Gg: AYBFou0oPRDS2AgpNH3RnbFP1J2Vr8A4imLE0G/0la6465KSb3UP8KWD0Y6IYkJFj4+
	CoVjr3/2rHUWTEE/4aSI4e9TqZxwd1vz8s1kEc0XItliP13H5vqo+PlbcPndc7iPIaIdNrIesDH
	OJ2wSiA9G/8ZGry1v5TYwSdiSbw70qqYobAnkfuT1AT+roJvKX1dP8hl9VX89nyulLRhIVdqyy/
	9SjLsYXj/DwH1Nd5YXTq1dsQh0L1Kzomwj5FTW6h9S42D2G8ad6x/0L6YnNadGryqGxIEgy8E34
	vAxW3yJvwGgqJjeJ8WAY79yDeqkcshfZ/b1UiMTo1Q2IW6JuKRdOykqEWI+jtah4bcrdqrJverR
	WBUUHH5hXVi2Ph1yjk46GGOFIzG9kywieGIZR0dGUVlMvIhdTQUCB14y/A2eQolR9klxFeLbK0r
	foiwD5wTHH2qRjHoWqNP5pTHE5Okh1oRc0mi7PZ3UKsMZVmkGPqbHdtm1CDyqa41Y/a4zp7gMgS
	upO1S37DUlI4SWJDYt7gQ27dAh6u5T+y/w7DFiRuSxe4ifMz1NGs1vDdtx0lX7o2gnErQW3s3Ha
	RicryUL6VDT88sTUvWWO2OePpRpC7ioYfjK1RJ+cZ4SJL894EHWLTPVsPQzvG1oEOpRzTdjU0y5
	eUpyhMhHVEIHtVgOg6IGeILEqUpL6ixw=
X-Received: by 2002:a05:690e:1094:10b0:66f:c1bc:408f with SMTP id 956f58d0204a3-67ba50187demr4711928d50.82.1793661169876;
        Mon, 02 Nov 2026 15:12:49 -0800 (PST)
Received: from [192.168.1.110] (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf3303ebsm5946481d50.18.2026.11.02.15.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:12:49 -0800 (PST)
From: Andrew Halaney <andrew@amutable.com>
Subject: [PATCH net-next 0/3] net: add SO_PASSCRED_THREAD to get a
 thread-specific SCM_CREDENTIALS
Date: Mon, 02 Nov 2026 17:12:33 -0600
Message-Id: <20261102-halaney-scm-creds-thread-v1-0-0b4d75dbf35f@amutable.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQrCMAyA4VcZORtoC27DVxEPJc1sQKMkRSZj7
 76y43f4/w2cTdjhNmxg/BOXj3bEywBUsz4ZpXRDCmmMISas+ZWV/+j0RjIujq0a54JTnMI4h2W
 mK0HPv8aLrOf6DsoNldcGj30/AKCaSmZ0AAAA
X-Change-ID: 20261012-halaney-scm-creds-thread-7170680f8c5c
To: Kuniyuki Iwashima <kuniyu@google.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Christian Brauner <brauner@kernel.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>, 
 Willem de Bruijn <willemb@google.com>, Arnd Bergmann <arnd@arndb.de>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, 
 Andrew Halaney <andrew@amutable.com>
X-Mailer: b4 0.14.3

Currently, SCM_CREDENTIALS carries the pid of the thread-group leader,
despite carrying the uid/gid of the actual sending thread.
SO_PASSPIDFD_THREAD lets a receiver identify the sending thread, but
only through a pidfd. If you just want to know what the tid of the
sending thread is you have to do something like:

    1. Setup SO_PASSPIDFD_THREAD on the socket
    2. ioctl(thread_pidfd, PIDFD_GET_INFO) per message
    3. close(thread_pidfd) per message

For example systemd-journald wants to log the tid as "trusted field"
(aka provided by the kernel) but doesn't have a great way to do so
right now, unlike the options for uid/gid/pid which are covered by
SO_PASSCRED currently.

So add SO_PASSCRED_THREAD as a sibling of SO_PASSCRED. It delivers
SCM_CREDENTIALS_THREAD whose ucred carries the tid of the sending
thread instead of the thread-group leader. This is completely
independent of SO_PASSCRED, so a receiver can ask for both. Use
a new cmsg rather than changing SCM_CREDENTIALS because users
expect ucred.pid in that context to be the thread-group leader.

As with SO_PASSPIDFD_THREAD, recvmsg() on SOCK_STREAM sockets stops
merging data at a thread boundary once SO_PASSCRED_THREAD is set.

Signed-off-by: Andrew Halaney <andrew@amutable.com>
---
Andrew Halaney (3):
      selftests/net: pass socket options to the scm_pidfd test flows
      net: add SO_PASSCRED_THREAD to get a thread-specific SCM_CREDENTIALS
      selftests/net: Add tests for SO_PASSCRED_THREAD

 arch/alpha/include/uapi/asm/socket.h            |   2 +
 arch/mips/include/uapi/asm/socket.h             |   2 +
 arch/parisc/include/uapi/asm/socket.h           |   2 +
 arch/sparc/include/uapi/asm/socket.h            |   2 +
 include/linux/socket.h                          |   1 +
 include/net/sock.h                              |   4 +-
 include/uapi/asm-generic/socket.h               |   2 +
 net/core/scm.c                                  |  32 ++--
 net/core/sock.c                                 |  14 ++
 net/unix/af_unix.c                              |   6 +-
 tools/testing/selftests/net/af_unix/scm_pidfd.c | 229 ++++++++++++++++++++----
 11 files changed, 242 insertions(+), 54 deletions(-)
---
base-commit: 4dd16e31135ea8437a720222df34e8745f385d6d
change-id: 20261012-halaney-scm-creds-thread-7170680f8c5c

Best regards,
-- 
Andrew Halaney <andrew@amutable.com>

