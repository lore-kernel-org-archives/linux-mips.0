Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661172;
	b=oDzuQuHRMPa8gVl8bN0e9RhPsQ/9syz9zGEAvb4dVyy0goTqlm6yqSOvgNIPjeePs3ZL
	 VO4Ta2548iRmnxU3rsY161Cp/fUzsmK0LsDrnYtW2L1VJpOpG7v8dXgvQiPTGsoIq/2c8
	 vDOoOO2F+RhwLiaXVx63HdimSOjj6kcfS7JTpXjw0cYkqvK4K2/OkCU30JD85MluP5Xi2
	 VRn0IPS8FvVl9/heiDbRPkg9GGrCBLCYXF8PKutAapaCeXccqEaHgSPefpnpoz0M8+s6d
	 exbPHUWgHDRjr+u4OIk34d65xCcXT4kj+waXz8ahOjZ4FwWwkvqdV6ygv8QnJYQqR6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=IXbWJMQGtd+uEtpM2HfUyLm0yd6US+pC9H9lL0RbBRA=;
	b=l1DFIpcw1m9MSS8OANejRBozahl4MSJ2U2oUgo3yf7yNpP5KG0sg+KoF+iKkOWVrGI1T
	 4qdGxQSGXkW5LWYp+30ab1PFrm80tevVMfRA6wmvMdzww3kGwzwGoPEpK6b5BEanfiMpt
	 rwwz3v/ZcHy2Qg2wmDm5EDMbtjKmKHc8rPXRYNpOpNvLZzcay56qdpsKTk8/Qrk2YfOpR
	 UlXk8iTf0nf3Exhb2envqqfWtHxXYKeC9cMoI33MhH3hT280DPDT0xs02f1p01wrfV6hK
	 gm7xzTZAiec821kmv2NsEm5OWXn/8eyoBupdnietcA5ufg67czuwcqGjTpKEm+IZZmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=N3eGPNUd;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9B0606A33D
	for <linux-mips@vger.kernel.org>; Mon,  2 Nov 2026 23:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A9B0606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=N3eGPNUd
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b0dba37a7fso31846707b3.0
        for <linux-mips@vger.kernel.org>; Mon, 02 Nov 2026 15:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1793661171; x=1794265971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IXbWJMQGtd+uEtpM2HfUyLm0yd6US+pC9H9lL0RbBRA=;
        b=N3eGPNUdkta531jF+hIrN9rZQYMNpXgSqaoiSxtbqTqp1M8vaipwuj54onFs0KU+bG
         zEgvBSlyw7DBEKLmGNK27GvgC2fPfwCPeFV3tnyrdVCUsWZlSseiWa6EAMD2Pg1acT25
         lcAI4rQoB6uFnuPNhfE7NC+lucIN0Ltd/deV1IHl93RuJ2xPCoNms09+FK8sjqD5mRhP
         Q14Me68IGXOvFD4FJOPwpMVGyiTD+ETr5MzK+Ms/VmjPXRwJfMHrWBjd8lsfH53dFk8p
         r063sYv9hqlaewKwXCNK8j1eoM/N7yGe7X14DvDjkyebhomyZ6TokkTjbjYau+69TAhC
         6OWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661171; x=1794265971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IXbWJMQGtd+uEtpM2HfUyLm0yd6US+pC9H9lL0RbBRA=;
        b=hEWbrtPtSuM4A+X8oyROplqJvroWM71uCjzLcllEJBU835CUwc9lTzNpo4a9EkYbgH
         lBaDd2v6LsND1Kz3AEpJU6deRPeb+nY844YIEoAlYlM0Uu7teGtmnBiRPmZws2nsHVZP
         /NwVDigAem9/f019Vbg9uFe2Ai0NewxURVTtarSgbx77Exhj48BSoRjjbW66RxwP+GJ4
         vMVeikxtbNjTit8xZJTwl9bBUjykHGXLRlyKkXtwJ3wgRboeT9lddH64WSrE/zAcMmf2
         eVcNMySZc+7UrI+woIkBxGsC8XBrUYDMua7gR8SeAtax1JqurUSAc2gpYQtEeM5Z0Rge
         zcdw==
X-Forwarded-Encrypted: i=1; AKwUvBz3IggZZiZBK2aNP7Oxru16+fSCr0vrycNSrb/m3Uqu6H2LBBRBzFHbkHplBBVs3FyiSnlDGxHfjeq+@vger.kernel.org
X-Gm-Message-State: APuU4Z/7POpQEJEJn6HIHVAjc2oESoneCoAI1vcXvel1n0AM9HaYC4ys
	xAoJR37EEq9YoyUnqPEcPMvL1vIvZfOFgH3FMrDK9qKvxj1HSjx28ZsHAAkTB0YFr2CS
X-Gm-Gg: AYBFou1K1M0tqX+SCjsTd52CMWpaX+rLa6SbcSmc3ldNf4Lf8uMvtv4iozlb1bvtG4D
	I8tI0I28rHliEu6qSnVVu2xP4JMjsku4E7Bd16qRjus5ZcqXg3JHfd3Nvz0SNuWxg9otlxntOxf
	p74uU1JTRl8qe4mPsDKnvyfqVjgj4DfHBX91xOzPDpYR6m/dBeSP+yCH/q4M5LK3OXWST/xbrRN
	sOdzbYuiI7GWCTnA+LiHTvg8i9xQIPJrpGTbK23uFzSyGTdXtRR8k/lHiGryo1QH8h4ZSTKWFVw
	qc1HJOe8PuRmyZU/+TiJRwvyWJSGKchNtWFgKrYs7/Izrvc4g5zPbxLw3kLfrUkGdspJqWo+j2l
	DGpiXy/Z/Yu0+2BYMDvRaYfLkntr3i1Jx8vbXvf6ANQ3zEacplw7qIK4hDS2/P4WDJAaww4AW3f
	zY/VNA1YFJrZ3Wy+tUPEXLItA2qMgCY6RN64bPiafMy92eZkWUS1eBjqDgLuA6e0qwqhl5wBkUT
	0pnlVTrDX/Z5unF2ZyQB0uXmvPzjXql0bWHxF5e1tWsuZLdzmmrX9Sd4loxtWnggw2nEXTEKvjT
	uLYXtFF8Ref2dSPyWJsiETK+H/I2F8Lw2W1asR93CossK3EpnRyFoOe0jGKxfKuYA2sj2dJuIjp
	wyMh5AeEIztATSUX3brr60qkOoxTdes0=
X-Received: by 2002:a05:690e:b8a:b0:679:a0b7:2407 with SMTP id 956f58d0204a3-67ba4ee9d50mr6406540d50.40.1793661171164;
        Mon, 02 Nov 2026 15:12:51 -0800 (PST)
Received: from [192.168.1.110] (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf3303ebsm5946481d50.18.2026.11.02.15.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:12:50 -0800 (PST)
From: Andrew Halaney <andrew@amutable.com>
Date: Mon, 02 Nov 2026 17:12:34 -0600
Subject: [PATCH net-next 1/3] selftests/net: pass socket options to the
 scm_pidfd test flows
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
Message-Id: <20261102-halaney-scm-creds-thread-v1-1-0b4d75dbf35f@amutable.com>
References: <20261102-halaney-scm-creds-thread-v1-0-0b4d75dbf35f@amutable.com>
In-Reply-To: <20261102-halaney-scm-creds-thread-v1-0-0b4d75dbf35f@amutable.com>
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

pidfd_flow() and leader_flow() take booleans that pick between
SO_PASSPIDFD and SO_PASSPIDFD_THREAD. Make them take a zero-terminated
list of socket options for the receiver to enable instead, so tests for
further SO_PASS* options can reuse the same flows rather than copying
them just to muck with options.

Signed-off-by: Andrew Halaney <andrew@amutable.com>
---
 tools/testing/selftests/net/af_unix/scm_pidfd.c | 69 ++++++++++++-------------
 1 file changed, 34 insertions(+), 35 deletions(-)

diff --git a/tools/testing/selftests/net/af_unix/scm_pidfd.c b/tools/testing/selftests/net/af_unix/scm_pidfd.c
index cbe53fab44fc..7524f3f6a8aa 100644
--- a/tools/testing/selftests/net/af_unix/scm_pidfd.c
+++ b/tools/testing/selftests/net/af_unix/scm_pidfd.c
@@ -765,20 +765,37 @@ static int read_pidfd_msg(int fd, struct pidfd_msg *out)
 	return 0;
 }
 
+/* Zero-terminated lists of SOL_SOCKET options for the receiver to enable */
+static const int pass_tgid[] = { SO_PASSPIDFD, 0 };
+static const int pass_thread[] = { SO_PASSPIDFD_THREAD, 0 };
+static const int pass_both[] = { SO_PASSPIDFD, SO_PASSPIDFD_THREAD, 0 };
+
+static int set_opts(int fd, const int *opts)
+{
+	int on = 1;
+
+	for (; *opts; opts++) {
+		if (setsockopt(fd, SOL_SOCKET, *opts, &on, sizeof(on))) {
+			log_err("Failed to set socket option %d", *opts);
+			return -1;
+		}
+	}
+
+	return 0;
+}
+
 /*
  * Runs @nwriters threads of one child process against a SOCK_STREAM pair,
- * all of them queued before the parent reads. SO_PASSPIDFD is set when
- * @want_tgid is given, SO_PASSPIDFD_THREAD when @want_thread is. @nread
- * reads are returned in @out.
+ * all of them queued before the parent reads. The receiver enables @opts
+ * first. @nread reads are returned in @out.
  */
-static int pidfd_flow(void *(*sender)(void *), int nwriters, bool want_tgid,
-		      bool want_thread, struct pidfd_msg *out, int nread)
+static int pidfd_flow(void *(*sender)(void *), int nwriters, const int *opts,
+		      struct pidfd_msg *out, int nread)
 {
 	int child_status = 0;
 	int syncpipe[2];
 	int ackpipe[2];
 	int sk[2];
-	int on = 1;
 	char sync;
 	pid_t child;
 	int i;
@@ -807,17 +824,8 @@ static int pidfd_flow(void *(*sender)(void *), int nwriters, bool want_tgid,
 	close(seq_pipe[0]);
 	close(seq_pipe[1]);
 
-	if (want_tgid &&
-	    setsockopt(sk[0], SOL_SOCKET, SO_PASSPIDFD, &on, sizeof(on))) {
-		log_err("Failed to set SO_PASSPIDFD");
+	if (set_opts(sk[0], opts))
 		return -1;
-	}
-
-	if (want_thread &&
-	    setsockopt(sk[0], SOL_SOCKET, SO_PASSPIDFD_THREAD, &on, sizeof(on))) {
-		log_err("Failed to set SO_PASSPIDFD_THREAD");
-		return -1;
-	}
 
 	/* let the child know the options are set, it can write now */
 	if (write(syncpipe[1], "1", 1) != 1)
@@ -897,7 +905,7 @@ TEST(scm_pidfd_stream_glues_threads)
 {
 	struct pidfd_msg msg[1] = { 0 };
 
-	ASSERT_EQ(0, pidfd_flow(send_ids_thread, 2, true, false, msg, 1));
+	ASSERT_EQ(0, pidfd_flow(send_ids_thread, 2, pass_tgid, msg, 1));
 	EXPECT_EQ(sizeof(struct thread_ids) * 2, msg[0].len);
 
 	EXPECT_TRUE(msg[0].have_tgid);
@@ -914,7 +922,7 @@ TEST(scm_pidfd_thread_stream_splits_on_threads)
 	struct pidfd_msg msg[2] = { 0 };
 	int i;
 
-	ASSERT_EQ(0, pidfd_flow(send_ids_thread, 2, true, true, msg, 2));
+	ASSERT_EQ(0, pidfd_flow(send_ids_thread, 2, pass_both, msg, 2));
 
 	for (i = 0; i < 2; i++) {
 		EXPECT_EQ(sizeof(struct thread_ids), msg[i].len);
@@ -937,29 +945,20 @@ TEST(scm_pidfd_thread_stream_splits_on_threads)
 }
 
 /* Sends from the thread-group leader */
-static int leader_flow(bool want_thread, struct pidfd_msg *out)
+static int leader_flow(const int *opts, struct pidfd_msg *out)
 {
 	struct thread_ids ids = {
 		.pid = getpid(),
 		.tid = gettid(),
 	};
 	int sk[2];
-	int on = 1;
 	int ret;
 
 	if (socketpair(AF_UNIX, SOCK_STREAM, 0, sk))
 		return -1;
 
-	if (setsockopt(sk[0], SOL_SOCKET, SO_PASSPIDFD, &on, sizeof(on))) {
-		log_err("Failed to set SO_PASSPIDFD");
+	if (set_opts(sk[0], opts))
 		return -1;
-	}
-
-	if (want_thread &&
-	    setsockopt(sk[0], SOL_SOCKET, SO_PASSPIDFD_THREAD, &on, sizeof(on))) {
-		log_err("Failed to set SO_PASSPIDFD_THREAD");
-		return -1;
-	}
 
 	if (send(sk[1], &ids, sizeof(ids), 0) != sizeof(ids)) {
 		log_err("send");
@@ -980,7 +979,7 @@ TEST(scm_pidfd_leader_sender)
 
 	ASSERT_EQ(getpid(), gettid());
 
-	ASSERT_EQ(0, leader_flow(false, &msg));
+	ASSERT_EQ(0, leader_flow(pass_tgid, &msg));
 	ASSERT_TRUE(msg.have_tgid);
 	EXPECT_FALSE(msg.have_thread);
 
@@ -995,7 +994,7 @@ TEST(scm_pidfd_thread_leader_sender)
 
 	ASSERT_EQ(getpid(), gettid());
 
-	ASSERT_EQ(0, leader_flow(true, &msg));
+	ASSERT_EQ(0, leader_flow(pass_both, &msg));
 	ASSERT_TRUE(msg.have_tgid);
 	ASSERT_TRUE(msg.have_thread);
 
@@ -1012,7 +1011,7 @@ TEST(scm_pidfd_thread_and_group)
 {
 	struct pidfd_msg msg = { 0 };
 
-	ASSERT_EQ(0, pidfd_flow(send_ids_thread, 1, true, true, &msg, 1));
+	ASSERT_EQ(0, pidfd_flow(send_ids_thread, 1, pass_both, &msg, 1));
 	ASSERT_NE(msg.ids.pid, msg.ids.tid);
 	ASSERT_TRUE(msg.have_tgid);
 	ASSERT_TRUE(msg.have_thread);
@@ -1028,7 +1027,7 @@ TEST(scm_pidfd_thread)
 {
 	struct pidfd_msg msg = { 0 };
 
-	ASSERT_EQ(0, pidfd_flow(send_ids_thread, 1, false, true, &msg, 1));
+	ASSERT_EQ(0, pidfd_flow(send_ids_thread, 1, pass_thread, &msg, 1));
 	ASSERT_NE(msg.ids.pid, msg.ids.tid);
 	ASSERT_TRUE(msg.have_thread);
 	EXPECT_FALSE(msg.have_tgid);
@@ -1040,7 +1039,7 @@ TEST(scm_pidfd_thread_group)
 {
 	struct pidfd_msg msg = { 0 };
 
-	ASSERT_EQ(0, pidfd_flow(send_ids_thread, 1, true, false, &msg, 1));
+	ASSERT_EQ(0, pidfd_flow(send_ids_thread, 1, pass_tgid, &msg, 1));
 	ASSERT_NE(msg.ids.pid, msg.ids.tid);
 	ASSERT_TRUE(msg.have_tgid);
 	EXPECT_FALSE(msg.have_thread);
@@ -1052,7 +1051,7 @@ TEST(scm_pidfd_thread_creds)
 {
 	struct pidfd_msg msg = { 0 };
 
-	ASSERT_EQ(0, pidfd_flow(send_ids_creds_thread, 1, true, true, &msg, 1));
+	ASSERT_EQ(0, pidfd_flow(send_ids_creds_thread, 1, pass_both, &msg, 1));
 	ASSERT_NE(msg.ids.pid, msg.ids.tid);
 	ASSERT_TRUE(msg.have_tgid);
 	ASSERT_TRUE(msg.have_thread);

-- 
2.56.0

