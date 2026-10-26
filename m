Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013556;
	b=CPPlERo0+dYAUQEMM3bPEe2phqzfzI05hzMFHaCYaW7HJIvcoMvvRvxp8tVxnhbADpLX
	 m0zblWrgm+tJPHt5fCurCKhcME1fiR+ELp7sCwovp1qFvXYV+MJ/l43XiFGSfOTLuGQaf
	 1qLYtSA6ElujxOGe9+k7sZsqK15xgq5vxKQKIUrSeoHC5sAfYJ8SAeyZgGfEwmmxOX7yS
	 l4AIxAh9hpk0ocBeOvTN54pOH4EGNmgQaDrAmy1xKo3mDykS3o6bfeutc/xc37BuYYsBt
	 x41P2WbvJ+Rx9cGPFsATxCDtiE33iTaCqqv7UkePQ45TsxaPx5IxVjVrDraAdYOqGZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013556;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=bM61ehpgyizAvovaUdB8zXiHVxWcqVnRNJf7TtcRJMI=;
	b=2bc1ZtSDOOXQq/3wKgvGI8gndWT0BtCoMDHw3fxVoKakPMQVtPynQxUt0rMSmj7Sda7N
	 K+8SyFj1eZKHSjfHoSEcbOT2gCBHBirtvNmuBrk5EFo0HSz13kjjvxx+emydD6FIr3YkB
	 MFIPvG6SIBqIp1KNf081w4Oze/e8c1nNx37J6Nf5uHFRFvCvjUe0Tg4YSfJviCn9hUnpO
	 WwAes5Hwn9tdJk+FnJPCa5JSxfWVfcj2b0DO4L0iK2EhLZJoy/yALqhlnPqwkWYBbsP6m
	 yf0a2E/lFjNnWCP8kSpB4dQrqM6FrJmrN1zelwC+W7jHZkWxMikZljbnUT29TEGkcFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c3RAloDM;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70709606A33B
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 11:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70709606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c3RAloDM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793013555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bM61ehpgyizAvovaUdB8zXiHVxWcqVnRNJf7TtcRJMI=;
	b=c3RAloDMEcq72mi5KfpJ20vTP84yXvP4zedSsZvFi2ArA0jH+kTmwCF6cr5YgHm25ZeUwd
	Ds2jInuTAvjaA4iYxhg1GcRw4yc8PHaS+8PUXgu76ByGX1gZWVGKxPxYPfCTMmkiFp/zOJ
	cQL5JnRwUxUvrduD/xzf4c3CO9bCTHI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-582-CumeemOmOJOuBM2QvMTNQw-1; Mon,
 26 Oct 2026 07:19:10 -0400
X-MC-Unique: CumeemOmOJOuBM2QvMTNQw-1
X-Mimecast-MFC-AGG-ID: CumeemOmOJOuBM2QvMTNQw_1793013547
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3E64C1956094;
	Mon, 26 Oct 2026 11:19:07 +0000 (UTC)
Received: from jmarchan-thinkpadx1carbongen9.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 44ADF1956087;
	Mon, 26 Oct 2026 11:19:01 +0000 (UTC)
From: Jerome Marchand <jmarchan@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arch@vger.kernel.org,
	Jerome Marchand <jmarchan@redhat.com>
Subject: [PATCH 6/7] asm-generic: Remove the unused non-atomic local_t functions
Date: Mon, 26 Oct 2026 12:18:21 +0100
Message-ID: <20261026111822.458404-7-jmarchan@redhat.com>
In-Reply-To: <20261026111822.458404-1-jmarchan@redhat.com>
References: <20261026111822.458404-1-jmarchan@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

While working on a fix for a tracing soft lockup, it came to my
attention that __local_dec() was broken on ppc64 and other arches (it
actually increment the value). My first instinct was to fix it but the
fact that this function was utterly broken for so long, decades for
some arches makes me thing that those functions have not been used for
a long time, if ever.

Anyway, they're not used now, so remove them.

Signed-off-by: Jerome Marchand <jmarchan@redhat.com>
---
 include/asm-generic/local.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/asm-generic/local.h b/include/asm-generic/local.h
index 7f97018df66fe..4bb458b57d470 100644
--- a/include/asm-generic/local.h
+++ b/include/asm-generic/local.h
@@ -47,11 +47,4 @@ typedef struct
 #define local_add_unless(l, _a, u) atomic_long_add_unless((&(l)->a), (_a), (u))
 #define local_inc_not_zero(l) atomic_long_inc_not_zero(&(l)->a)
 
-/* Non-atomic variants, ie. preemption disabled and won't be touched
- * in interrupt, etc.  Some archs can optimize this case well. */
-#define __local_inc(l)		local_set((l), local_read(l) + 1)
-#define __local_dec(l)		local_set((l), local_read(l) - 1)
-#define __local_add(i,l)	local_set((l), local_read(l) + (i))
-#define __local_sub(i,l)	local_set((l), local_read(l) - (i))
-
 #endif /* _ASM_GENERIC_LOCAL_H */
-- 
2.56.0

