Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074514;
	b=X8UsMUDbeGIpPUmFypMRS1q54fgaImZINl7KL/qMfBoaaD7DamS6AyjOcCSd9+SbDkEW
	 xnaVJSACEsOgu1RnGV/pjPytty/Et7EGB6Mpyz9Hiok7pu1U6sNrrRjpGCbKBRXI22+ht
	 sNECwk+EYG4pUOWcqONjKfVINPh5cY+c/3aHv2KAq97V3hjoBjJmwQlcCmi7pEp0IC8DU
	 dfDDduKJVlrqdpcUqY+249eY96+shYvGzkNssI8a8ANjpvK9STnkuviOOleiStptJS8PS
	 XMTGJeNiENSsymqk2wwdb08Ay+hoPdaPMKmGXHhvQTkq87bfOpABEg3kXt1aG/0qDag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074514;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vmZk9/Vpa3CGsFpach0w6FgXWKmQOWGxhsMKrxJ18rY=;
	b=SFcJd9vmQiMDlBUFwO/VrrJoW0fwnAkBnkivne6uRW0VK5mVRqCy9nMiEP91crSMDNu3
	 AYt9Mr5aZ5NxMr85CqsCjxvgbiIYyzGwVelQATuEuZgqtqzhxb5cj+HpPUIzOfZP4vygI
	 itYftBOaUxAfU7DiAtnauj460zWawXZG/JFc/cBal1YkvTzIu7DxWs7TwYu8pr3A6VMtt
	 4G3iUiNmGmofyJuqit+rKRrFUX79obKN+r0lxX7VsyzCE8rnDum0DY/dWwlNgHs5QG865
	 5ocnxKgOm15Rn6vdX3tDpqs+k4YQ+m0M/RpDD98Ge7En3sDruV/2lwVwxOvcHi9Sjhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tgIX+mhW;
	arc=none smtp.remote-ip=95.215.58.2
Received: from mta1.migadu.com (out-2.mta1.migadu.com [95.215.58.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA13606A32F
	for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 07:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BA13606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tgIX+mhW
X-Envelope-To: linux-mips@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qEU0Tk5tuRynFX1J3Q19vVq3w7Tb+EgsrJVKUkkp2HY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795074510; v=1; x=1795679310;
 b=tgIX+mhWqzdh7C8R5xqdoUXUMmq0Qio9AUmRSb4IL9un0VXClm12+sDcI2ae8GDY/JCSC8WT
 WZ4nqgivxCQVZHk+J+0cpns+p3LrVk7RcyYNnBCm3CNryMgOoPGKpwPd8OHHVz33Lr6bR0id4gM
 9g9crN8V62KpUpfsb10BJs18=
X-Envelope-To: linux-mips@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7095458d099e9dc5;
	Thu, 19 Nov 2026 07:48:30 +0000
X-Mizu-Trace-ID: 7095458d099e9dc5
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
	Randy Dunlap <rdunlap@infradead.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 6/7] KVM: Fix the range of reserved arch-independent request bits
Date: Thu, 19 Nov 2026 07:47:51 +0000
Message-ID: <20261119074752.1027729-7-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119074752.1027729-1-fuad.tabba@linux.dev>
References: <20261119074752.1027729-1-fuad.tabba@linux.dev>
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

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
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

