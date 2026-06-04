Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F9E47DD47
	for <linux-mips@vger.kernel.org>; Thu,  4 Jun 2026 13:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579200; cv=none; b=Ug+aTPgOsSWBHwgc5oPQFy5/1EN8oVXNx1vAtuJXVsIOyTitXax8vPW4CVuP5GFtc98m5MDMzgXHXIabNpf86I0ElFys3+6bwg9mgqfQHhjs/ZZqD2nPDrM6yeD5k0ehwtOPIEsn+7mAfLbyCdY2U42W+6Qw1yzhYafHnpTKuQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579200; c=relaxed/simple;
	bh=9eVs5ZEWu5PvYIeNWvEPYnAIntZhT6pYVPj8oRQzPMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xp5+Bl9dwdwy2QL4s/A6IK6XrEOJSQsVCA1iCDJoHdycwksIT5Bb7K5B5oMueL4FhlANIiB2oEyzlng++QGNk7r5+YX9+tRvuqBWWUU2IGnfoXJBY2fUE1oZIqxPcL3r3qC/pm0CPS4zuVws2choLRPOTdWb8HF2v/ombQfVXeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mpZ3l25S; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpZ3l25S"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ef29c5561so424460f8f.0
        for <linux-mips@vger.kernel.org>; Thu, 04 Jun 2026 06:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780579193; x=1781183993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aaZcDuR1/GVoL4knmseDPUzz2J8S5y/tkogd7uxcn0M=;
        b=mpZ3l25SQenUDvGZoaVJnEVxe1HXEkFpGlBhLdeOckjQjtO/yH+NAuqA2SLfFJetF/
         ZyV2JCse2h7PtuwvqwcegCR6ZJxJHTSRACPG53tdpFoPHfPDja/mt2JhBUmQqkEOu57D
         CjV8usPRapvIKuOdiiOoj77OOl2JHfNJOOGZe5ba9Dp8rI58KP1ibBxgzWW0SYp+en+q
         Z1Nhq9YqFJWmXE0Mcb8LErX+EKAxZSz/8uMOzjPVwf+Xx5m4WkzCtXHIag9xR+50hHxZ
         zU3f7CLKizV6i6r0lqWN9tJUEPS/iMAK1dqqyzhsZT972JyNStQUEMtzRVjsTKxXbUfs
         pjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780579193; x=1781183993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aaZcDuR1/GVoL4knmseDPUzz2J8S5y/tkogd7uxcn0M=;
        b=QBEsBHMIguesjWhBItl8+9tZ7xiF2nPHH2O6rnRq8OTNhwqa76+G8eXpk84WAsQfKS
         c9BYIGbeQEfbhgL/QdazafTaofKric0hWqERw9ei/hfj1++yvY8dPEhVDE8fPTEqEcKF
         uq1HZbGcCQEjzR/tbZz0OjLhwmzLQPmy8D3W9/r+q1h/ll09RpIC1KWuEB4A2ujv2nuX
         mqszow9X+dJciAktWrxT8fOPq/GrORBqP/Nt8LwfAP+u+KmACthRDBEhs7dXbu/vL868
         gQKp4u7aNgBY9h31skcNEQYzFpwQMzkjfplzvS06TvpHFWuckrD0IDc+W+eRzd/dupgj
         xL/g==
X-Gm-Message-State: AOJu0YzRULHxFs33PGQCC8VUa11N45Jjcnmc07D6tLGleN+Br1C/ldK5
	f+ES0QVdq7VBf3grXPsWtb/yyHNtCtXNMfr248LMPL8TeOBybgOiQNyz380yrjuo
X-Gm-Gg: Acq92OFpj60Xl9aLn659+hjkhMcgHFK5zJEUFBTSYi82psDhLwq2rYSUvKzL54tatTl
	CcH5gt98FF7kw0DZPZV7kWXg1RLsb+KPmVWFUP6G6Hbp5LFDHLIGIQyLUgzAIjQ15hn430ocI1n
	JsTBznN1/V0W+espANkoLjp94DjnAZ7+tU/8OR4kZbLQwUO8h2zTF9sekZQNBsmvZy4w8vmRIBx
	BNWnRwu3+oSXAuDVYvacca6mM+TGtKjJcdeVp0wf8ZI52gpFQr0f8rVZnwDtDaJ5dQT5A5aDKFv
	9WJbawUv5KLFjrMJaTZivS9Gj9wHJ6HCnlx8jJDwUCWcf5yL//Bwsu50wTEMBOHzGwaw8GC4ETk
	0MJ20+6XHI/FRTDNkFQvmeZ+JjHtQR+hxMP4KFB4bepm6HUmA0kF5cKoiobAmaQyDgxEscmmX6e
	aK5TNyC/A7TpMbFHWueraWajcJQarzbf5s
X-Received: by 2002:a05:600c:a09:b0:490:958f:2a5c with SMTP id 5b1f17b1804b1-490b5ed6375mr133235845e9.17.1780579192962;
        Thu, 04 Jun 2026 06:19:52 -0700 (PDT)
Received: from localhost ([94.53.77.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7a52dacsm7715545e9.1.2026.06.04.06.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:19:52 -0700 (PDT)
From: Catalin Iacob <iacobcatalin@gmail.com>
Date: Thu, 04 Jun 2026 16:20:25 +0300
Subject: [PATCH v3 2/6] scsi: core: Move scsi_device_from_queue() to
 scsi_priv.h
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-remove-pktcdvd-references-v3-2-e2f06fb4eef4@gmail.com>
References: <20260604-remove-pktcdvd-references-v3-0-e2f06fb4eef4@gmail.com>
In-Reply-To: <20260604-remove-pktcdvd-references-v3-0-e2f06fb4eef4@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Jens Axboe <axboe@kernel.dk>, Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-scsi@vger.kernel.org, 
 Catalin Iacob <iacobcatalin@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1518;
 i=iacobcatalin@gmail.com; h=from:subject:message-id;
 bh=9eVs5ZEWu5PvYIeNWvEPYnAIntZhT6pYVPj8oRQzPMQ=;
 b=owGbwMvMwCX261qtXAKXKjvjabUkhizF6vU3LqT3G94r9cqys+vtuZina/9q/t07UmFefy8un
 b3PXWxjRykLgxgXg6yYIsuLc9fbNuw5E3Avya4FZg4rE8gQBi5OAZiI+zSGf0qLXDQLS2uXPT03
 Kf2kWOsWYcVL01cdWXVcSm7NuVPX+4MZGWZd0Pu7+WuqS5Kxo3SX/azfa+t/Oh0x/i7Au8Di5/Q
 djEwA
X-Developer-Key: i=iacobcatalin@gmail.com; a=openpgp;
 fpr=F609BFABD84EB5C9DDDC37EDE89C6A3571CD0E33

scsi_device_from_queue() is only referenced in drivers/scsi so move its
prototype to drivers/scsi/scsi_priv.h.

Signed-off-by: Catalin Iacob <iacobcatalin@gmail.com>
---
 drivers/scsi/scsi_priv.h   | 1 +
 include/scsi/scsi_device.h | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/scsi_priv.h b/drivers/scsi/scsi_priv.h
index 7a193cc04e5b..37e5601be2b8 100644
--- a/drivers/scsi/scsi_priv.h
+++ b/drivers/scsi/scsi_priv.h
@@ -102,6 +102,7 @@ void scsi_eh_done(struct scsi_cmnd *scmd);
 
 /* scsi_lib.c */
 extern void scsi_device_unbusy(struct scsi_device *sdev, struct scsi_cmnd *cmd);
+extern struct scsi_device *scsi_device_from_queue(struct request_queue *q);
 extern void scsi_queue_insert(struct scsi_cmnd *cmd,
 			      enum scsi_qc_status reason);
 extern void scsi_io_completion(struct scsi_cmnd *, unsigned int);
diff --git a/include/scsi/scsi_device.h b/include/scsi/scsi_device.h
index 9c2a7bbe5891..9f716497a959 100644
--- a/include/scsi/scsi_device.h
+++ b/include/scsi/scsi_device.h
@@ -407,7 +407,6 @@ void scsi_attach_vpd(struct scsi_device *sdev);
 void scsi_cdl_check(struct scsi_device *sdev);
 int scsi_cdl_enable(struct scsi_device *sdev, bool enable);
 
-extern struct scsi_device *scsi_device_from_queue(struct request_queue *q);
 extern int __must_check scsi_device_get(struct scsi_device *);
 extern void scsi_device_put(struct scsi_device *);
 extern struct scsi_device *scsi_device_lookup(struct Scsi_Host *,

-- 
2.54.0

