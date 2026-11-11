Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.63
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387316;
	b=5kCOI5TEN5/0R06o8SjbyHJYizqkQ1tST4hDGD4uY3Z9tvRwmSKGC4dq3v+ZuzXMSs89
	 ereSY1Qcbw2ESV6Ux4YeaEJFWj4U7VSgOARBZLBUqtt/Qlm/RorrY6ytsPYAAUuimhZSF
	 nMB2KxJsHLyUcOV7SpFxAwuNDu0TPIo5CjXruQSpgfcjvg9FkUMvc+ZFuPVFeQxgEyPyL
	 JiXqnDaxNH5JMWewuKV21JII2rv1Jxp4Jleek5huwE3pGfwQx977wc+jien58dqZbGYwq
	 h5X26CyfwV1cqTc3uSQhpxRJ7HDQz7ynXaUvzruJdl24Wra4Cucdscgy8ZTizxwPAVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387316;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sU/uCzkrcw4yzr4Jgej5zFnIX6J1nsjRWMYoNMeMIes=;
	b=sqFKGAzWz6WNWdbEjJ/54izNE7xCVubfaCePqBONAR2FDs/RtvwEK0qjxEj6iM/vyQs5
	 wMtwrFHDZdbRjxtrikcQQDtj9yzE+GrtGsVtOhZwjlwi+PIpXPxa02CjhbGEmT0qp5mq+
	 AJHqsatAsa9i11glhPMPZx35U/R3R7Zz8ysTwwiU+ngt0OG+iAz3ayx0l72vfCeJIMY6y
	 6mEMm8O13pk5dyxk9LEdYTh48fp4UZMh4ExOBhUwR6KAJzbnmpZdQoNBavJeinq5MBU2f
	 73wZT9ryGRYLlNDu4cItw6edWqQ076cdaipUQVtD3MvkiQXlKFaHeyRqZTGNCZfiXYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EMQHBdVV;
	arc=none smtp.remote-ip=91.218.175.63
Received: from mta0.migadu.com (out-63.mta0.migadu.com [91.218.175.63])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E4B60A5BCA
	for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 08:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51E4B60A5BCA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EMQHBdVV
X-Envelope-To: linux-mips@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qMpJUnOcEqt7DYSuh3G5DlyHK2LhQjmbYg9/ai4nvKw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794387313; v=1; x=1794992113;
 b=EMQHBdVVoVdZCMjpVuQ5dDKfy0QV/X7eMXzFkoGOPGhfJAd9Dt3Kpw10pdGbv1lfNFOHMCIp
 TkJdWC4dffEH2olJ85k06QRbdDEhMWPFtFsbuHF6IvYSHDIvLsceK6bHiIWoVuaFCA6aiPvVRvJ
 5NQncuuOzytX34GbF8PKQkCU=
X-Envelope-To: linux-mips@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 797d428f08b91c42;
	Wed, 11 Nov 2026 08:55:11 +0000
X-Mizu-Trace-ID: 797d428f08b91c42
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	linux-mips@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 6/7] KVM: Fix the range of reserved arch-independent request bits
Date: Wed, 11 Nov 2026 08:54:47 +0000
Message-ID: <20261111085448.1130701-7-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111085448.1130701-1-fuad.tabba@linux.dev>
References: <20261111085448.1130701-1-fuad.tabba@linux.dev>
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

KVM_REQ_DIRTY_RING_SOFT_FULL is bit 3, so the bits reserved for more
architecture-independent requests are 4-7. Fix the comment.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 include/linux/kvm_host.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 4b91ef9667703..21207d234618a 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -165,7 +165,7 @@ static inline bool kvm_is_error_gpa(gpa_t gpa)
 #define KVM_REQUEST_NO_ACTION      BIT(10)
 /*
  * Architecture-independent vcpu->requests bit members
- * Bits 3-7 are reserved for more arch-independent bits.
+ * Bits 4-7 are reserved for more arch-independent bits.
  */
 #define KVM_REQ_TLB_FLUSH		(0 | KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_VM_DEAD			(1 | KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
-- 
2.47.3

