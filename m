Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794658532;
	b=s5qJN0aSAOf2xqcG24962gcDcBGmNyCtOZ9woX7Dao/0Hp+ywQRkhk5FzbkSFKjMBT7T
	 Rc1IHkWVHhccBSt94IG4gtMc4x2FA+i2ag5873vc8foFbjJDThNSDvKR+FCEZLLntRYK6
	 Hx+r0j6TsOIhuUA+jbZnXY/yW9uWLvGEk1WsAZRSiwLoWkT2HvQkEiVQc2BGfq7qTN+JQ
	 JWofLdJghmaYcclrB3g3rjNQ60KRJ3bglYClnsmgGyHAHHyCeSNK1tl5qsR7l4mcTuMxM
	 FIHNgvGm16Wk5/KgyMkh+WQB/ttkZhRQlxx76CBOz+zDouTmk1oJerlMyhJszS5UN4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794658532;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oWuOwDFhTmH3ChqYEXokVxql4X4DiTpIDjApkuAhTfs=;
	b=ydlFYRsvWAYkRK5h+LH483zVi89vRzUqnvk4nK6L91vOGPIxxMrBXdd7Uwl4ONH8Iuzn
	 6NL4Fr4FIzeiq3sVaz4SexAs/uRDufePZXFmrTbLFa+g2IWwUYYW+/pTRr8ihgdCtGxhl
	 TmxkPqCebs49mi9kQY2ieWjQdai+vUXMism2TrRqxIvYET3M3BKTb/am54S7J9DpNlLuO
	 7kvrsfd7Hc//L9QnxZQxQb7Sy7AioKpgRvLqBabFzlGlSqf65Y8l3bhYslf1EzugeWJ77
	 yUgHXJvLbZxyjVg2zx+UiYrQq89pcrbkfiJ9Xlr0WeN35MnC2BtZ1ajIuWfAESKHsjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=kiD2WV2G;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4900606A323;
	Sat, 14 Nov 2026 12:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4900606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=kiD2WV2G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=kiD2WV2GAAhcwSn7IdlWDZGC6iUOUnQT53kkKSsN5aHTk1ZBAWtrtkPkq7+pX3jRmTIa5iTE/3yil
	 hclbYCRCUkLVoT38bxmeGdFd9wTrEd7mhzQ2gn03XWY6fgWLhw+o9AFMYTzyw9WAK4eHAIousxT+RH
	 XJDAoRkw2RGs0EK0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af850ce47b-be2b0;
	Sat, 14 Nov 2026 20:15:18 +0800 (CST)
X-RM-TRANSID:2ee66af850ce47b-be2b0
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHD-W7400297 (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66af850d4ac7-4462a;
	Sat, 14 Nov 2026 20:15:18 +0800 (CST)
X-RM-TRANSID:2ee66af850d4ac7-4462a
From: Aibing Chen <chenaibing@cmss.chinamobile.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] EDAC/octeon: enlarge the L2C error message buffer
Date: Sat, 14 Nov 2026 20:15:15 +0800
Message-ID: <20261114121516.1306-1-chenaibing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

_octeon_l2c_poll_oct2() builds an error message by prefixing buf1 with a
short description.  buf1 holds up to 63 characters and the longest
prefix is 33 characters ("Tag Single bit error (corrected):"), so the
message needs up to 97 bytes, but buf2 is only 80 bytes.

Building with W=1 reports a -Wformat-truncation warning for each of the
six snprintf() calls, e.g. for "L2D Double bit error (detected):%s" the
compiler notes that the output can reach 97 bytes including the
terminator, into a destination of size 80.  The printed message then
loses the syndrome, type and way information that buf1 carries.

Size buf2 for the worst case.

Signed-off-by: Aibing Chen <chenaibing@cmss.chinamobile.com>
---
 drivers/edac/octeon_edac-l2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/octeon_edac-l2c.c b/drivers/edac/octeon_edac-l2c.c
index e6b1595a3..5eca6e204 100644
--- a/drivers/edac/octeon_edac-l2c.c
+++ b/drivers/edac/octeon_edac-l2c.c
@@ -62,7 +62,7 @@ static void _octeon_l2c_poll_oct2(struct edac_device_ctl_info *l2c, int tad)
 	union cvmx_l2c_err_tdtx err_tdtx, err_tdtx_reset;
 	union cvmx_l2c_err_ttgx err_ttgx, err_ttgx_reset;
 	char buf1[64];
-	char buf2[80];
+	char buf2[128];
 
 	err_tdtx_reset.u64 = 0;
 	err_tdtx.u64 = cvmx_read_csr(CVMX_L2C_ERR_TDTX(tad));


