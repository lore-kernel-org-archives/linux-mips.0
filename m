Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B65398911
	for <linux-mips@vger.kernel.org>; Fri, 21 Aug 2026 23:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787355486; cv=none; b=Kbw1EaCiF+IFoFEahsJAvefu/koKDGhXvjnZWJH3tJrz0HUW1z7bbW+qinomKgRGLflmHTa1d8YCHHdwZu31mbhhYCrkhNYlMlSjtB33aWEpViSWwXYkfgXBQZFfcfqP1wmnZi135cxMadkI98IsgQABHPNaItnZiN9Iqgwcr00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787355486; c=relaxed/simple;
	bh=tlhxNUfa2bemmyXBM/pSS/jsWlauoYuZi6Gg7O1kyIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U0+5Hnj/IFO+1pPUPiCNGsluYupYA0M1+gC6KUb7D2ekQmCxYBJRiQFoGyl5z2H2NsQjweKY3ObLoNgcpsLYHyUU3V4dHIojC4g8vIxeeNRFxBtzO917wZ11W3rsljergyf7mfVNkun4lrK36edDvwD2F6UoEm0y7G5uYfZBcxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTbkLufq; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTbkLufq"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38deea72eebso1658346a91.1
        for <linux-mips@vger.kernel.org>; Fri, 21 Aug 2026 16:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787355484; x=1787960284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y5Whma5xGLCndJ2R3MrmN5oH5Lv0H7u7llldvs/ICGI=;
        b=ZTbkLufq6LFDkxnr6rLrsxQREcNkAQXX+yiNgBWtKVee2KwA3qh/NGU5AfzqMCdgdl
         DUwyXgxVrhhCd9v8xHeax+BPuCFdLAZcCNN18fzHFxQahsEQ0O6EMGvTykPLWqtq0dXD
         hJnS/ZzwhPiWwJHUPi6lK5+aNpF8OS7sjZw5YDsqulOLv0AWjYe16Zdonc0gQcTg5LAe
         o1I5LD7v58QN2bwv2H4wonE6kMz13d4umfS1PvRCkGf7iOIpyVhqeK8POQXxYap81G1S
         1KQEf1nJQtcrw/mmB8LJVeEOsLlNX6pIuz/lggkMQnvDzrGQlfuwv7fdN+gnN5sjz2Am
         Hmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787355484; x=1787960284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5Whma5xGLCndJ2R3MrmN5oH5Lv0H7u7llldvs/ICGI=;
        b=liR7PuB80VceWIixIB5jAIPIscYqsQ44PdH6y34dewaJWE04cE5oshvMEvD7sN7feb
         6SxkRpT4ZBfT9cMWvFQDjCdiYzSVGm+2q7Y0vL3Yrhf1oPwwoNXvSwU/HdUo8FbhMW5E
         ym3yhtj/GILhtlkenBPqPUkLGu5FY8mFMdXWJvz4/dpK9Qln9JSc+MoEMAoq+2ReJL3R
         9vZnwPTmKw8gjKSDvRzpSkA87tZwjrL4V981OTqkQnZ+gi2/8ubAmVAUcMWWqtEEivI8
         LQewvKa35T9fs//YVQEOA3K1vTiTiqsAhexUFvZc9FxI/kSknii8cwv5/phVFqVm1XV/
         jhFg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7R+ZkkmcGBPtWkFUX81Cvj3h2RLngbbch1d7PQ6TUkJqy1ta+eBvuLZCx4JquR1CuJNcdju8cTrPg@vger.kernel.org
X-Gm-Message-State: AFuF++nkep2lkoxv0JpQm8vEkOJu08vRmikPLxog8xx3zTklgkkBbPnV
	EZu2dGPuS9UldenVyr+h51C8qctUyVW1Z0AYFU/qbVJEhnBt5N63rqhH
X-Gm-Gg: AR+sD12MhbTaLlTUvao6wnJR4NooZbHMu+LRjhOqnvuBrnfBVfa4Kq4vB92D411EBcA
	RbK3pVP7Qz/GnF8X9TYhqbup7DOe7tLVTtbIcmK84dHkvaa30gKMxQlMMnUXybGqrqFcumf6SGR
	B7GPjyFJMSKCpX4EmLvKJyZWyj3fuJQGc1/LzohTddZwRz2bbNH+7gT04eWVuzSu1QsWgwVQfzH
	I0BjNhSB1iTaAvx2ViL/dUXOdTZt2zyuTvPZUIRVO6WCXDYknuXCQwytITE1WwuFHqlDHFJx7Ko
	LP7f0eLYn1TYiVtVkdDm2q+Y2EjKgKz1VIPjezfkNVETmhIzqWrMXnQx6bBcRBG6zjsZpcxM7uk
	WLmj2QXn6cWo8JOK/8TZdSvgrEYArKcY/38208gPRlYJBn3bTjYY9n2DWb0YmZMQM3yH0SMjlJH
	P7Hj8rGsQ+40Umbz2HRUWxK3VEbrUbyd6UaE0kih6eHwzjTfWLSBPfAeB55JjGjCVmKMulSS+zU
	wGWhKh+T+DeWY4gIogvAVkSc6aqfa5QP54yB31WAzURpJmmNYq0
X-Received: by 2002:a17:90b:1d50:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-395df29b3c5mr3809215a91.12.1787355484313;
        Fri, 21 Aug 2026 16:38:04 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e499481dsm630370a91.5.2026.08.21.16.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 16:38:04 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hanzhijian <hanzhijian1991@gmail.com>
Subject: [PATCH] EDAC/octeon: fix kernel-doc comment for co_cache_error_event
Date: Sat, 22 Aug 2026 07:37:51 +0800
Message-ID: <20260821233751.2331272-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment for co_cache_error_event() starts with "/**" but lacks the
function name line, so scripts/kernel-doc reports "isn't a kernel-doc
comment" and it is silently dropped from the generated documentation.

Add the missing name line and document the parameters.

Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
---
 drivers/edac/octeon_edac-pc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/octeon_edac-pc.c b/drivers/edac/octeon_edac-pc.c
index aa1219db0..076a3952f 100644
--- a/drivers/edac/octeon_edac-pc.c
+++ b/drivers/edac/octeon_edac-pc.c
@@ -31,9 +31,11 @@ struct co_cache_error {
 };
 
 /**
- * EDAC CPU cache error callback
+ * co_cache_error_event() - EDAC CPU cache error callback
  *
+ * @this: notifier block
  * @event: non-zero if unrecoverable.
+ * @ptr: unused
  */
 static int  co_cache_error_event(struct notifier_block *this,
 	unsigned long event, void *ptr)
-- 
2.43.0

