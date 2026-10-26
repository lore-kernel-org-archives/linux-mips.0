Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013529;
	b=unqwfh84yoF1DJCG4D2++r46EJA6gAg5kOxcCVwnApMOn1LbsFOazzaL97x5m06zVqod
	 u1CtD/FWK7WqvB2zOkn8YkmKivVJPDAcAdqtfZ9poWEozZ4XKA4LJjr7zqGWzZbx/lkoU
	 LeEouLUdcozEgWeHa3klLkcBg8c6ct9ZtCMsuG69A+lH6CqoOyIXaUILneCWZaMgQOZ3P
	 Qk+dXxCtIrZb+Bi4MWIVlDZuYf2ctPdR7emvj4B5GSC9MMRnwpH2lepdI/u0Q7kAHFuWu
	 1rkdnqZ77NxRdgxu4zF6EY+TpPx01Tcj44yZfc+tAY1JBJI1MyFcwddm6DF5N+kVwAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013529;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=WoLSU0BjIbmp7+7g1f+xo2mz3fVrgAdefYVwWYlLpDI=;
	b=joamtwocjWhZ9jI/5s83LXrdvvPhpYXdmhMYXVbumfxssoHp401v4jB/KUrdTF0yiErS
	 dUPdEoRzst7YqXGJi9Af9qHslJ5tg1+U/4LZvN0uc2PoP63BNXxS3NDpjn7jDSr4cGn8C
	 dUZjOGJrC4EJQfUK8P0w3MVM+iCOaTrPnvuKGu/TZfPa/Gx4150NiqHwg9sqZyS+GcBVm
	 JCEBdAq23xWlzKyp+HFc08YYM5bKM47Iqg6pl85o+7q0uQzdNaotZgzSAew3jtF5Q+M4t
	 5vtQn1g5FBchujfGRUkaSxFD+vqENgqnJ3GsFfvyV+3VxhLTF74QAgmufBhcgdoJO2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ja213d3E;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CD4606A31A
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 11:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5CD4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ja213d3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793013527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WoLSU0BjIbmp7+7g1f+xo2mz3fVrgAdefYVwWYlLpDI=;
	b=Ja213d3E+9bkJCgWFjQJK3TWGZcLhvN1pIB7lL1BjoEBExteK4vMc+TKgld7IFAj883tV8
	E6051S1wqZ0m7RJ6C8ZXHQjsaqheTX7nX8DhMrJ7GhwrkLk6StPme1EphzFsIPdwlEKZel
	GgbRv5a0kNpdf8B1WuREQDbENc6PUT0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-230-DPmm086NN1yVCgZEC1vTsQ-1; Mon,
 26 Oct 2026 07:18:46 -0400
X-MC-Unique: DPmm086NN1yVCgZEC1vTsQ-1
X-Mimecast-MFC-AGG-ID: DPmm086NN1yVCgZEC1vTsQ_1793013523
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0BB43180059F;
	Mon, 26 Oct 2026 11:18:43 +0000 (UTC)
Received: from jmarchan-thinkpadx1carbongen9.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5B64E1956087;
	Mon, 26 Oct 2026 11:18:37 +0000 (UTC)
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
Subject: [PATCH 2/7] loongarch: Remove the unused non-atomic local_t functions
Date: Mon, 26 Oct 2026 12:18:17 +0100
Message-ID: <20261026111822.458404-3-jmarchan@redhat.com>
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
 arch/loongarch/include/asm/local.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/loongarch/include/asm/local.h b/arch/loongarch/include/asm/local.h
index 2d118b1a060e4..d649b9867ba25 100644
--- a/arch/loongarch/include/asm/local.h
+++ b/arch/loongarch/include/asm/local.h
@@ -175,14 +175,4 @@ local_add_unless(local_t *l, long a, long u)
  */
 #define local_add_negative(i, l) (local_add_return(i, (l)) < 0)
 
-/* Use these for per-cpu local_t variables: on some archs they are
- * much more efficient than these naive implementations.  Note they take
- * a variable, not an address.
- */
-
-#define __local_inc(l)		((l)->a.counter++)
-#define __local_dec(l)		((l)->a.counter++)
-#define __local_add(i, l)	((l)->a.counter += (i))
-#define __local_sub(i, l)	((l)->a.counter -= (i))
-
 #endif /* _ARCH_LOONGARCH_LOCAL_H */
-- 
2.56.0

