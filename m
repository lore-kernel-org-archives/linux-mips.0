Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387292;
	b=2/lCnYAtub58AoSxqgzlBaJH0FG3wvcZZuj/E8edE8ySgGRvoUF/LD6FeFgv5aq/I/vT
	 MTpYCHakr98f+DqQe3C2a8sP2PH6NceBp3AUsnQY2Q1gZYKljLmnrP6CA/wgnN2jlfX37
	 A5jCE2qlbzbdYf593S/f0Qd5O/i0sQI5KrUffewtZt46mc7UOeBcK/EiUBxBuTwvftaMH
	 N8bn9AhSIbgEOb7N521R4ta3XuACd0cnN3SWZMu3cNsuhzs5Lobrajei62XpS5QIyx0+Y
	 RtEsB9ely4zC9/Jlsl9axDN/L8e0Q9mLKIe1PBlUCY6tWr95mi9X7GoigfY61ON9yPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387292;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h89S9x+6FNbsx1kk0qOjiYteMD3ffDL4FelhcMuCPmM=;
	b=oTAYJGLGlvCc/yPWyyQT/bA6kQGsPXlg2XJ6siKU0Tr14uSPs5/bJlncwB1WcWX4oGps
	 wbLE3QpXejBbBXgFYupFDjHUGGlmJo7KuwdG+5dQPVqRU7Kze5CDE1hTb6PUzoDZFYglU
	 AUiw/rnJTfKNiLefRwC/ZqjMmdZ74c4WqAeWu7wmZfnfcFhNzswAiGbfbLB55ay1E/deD
	 e9t1OW12KwynUs/Li2dS+UbDOYJx4BB0R7uzULeH7BU+1mBqrmBbMqfhyH7xNBL2mxvOr
	 +BJmzaJcWfdP4ktTIJGturYPzMj7LXNp5IO7q0o8rQvO4VE5IFu3wsvAgROmeLWTPuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TnwNEjHG;
	arc=none smtp.remote-ip=91.218.175.44
Received: from mta0.migadu.com (out-44.mta0.migadu.com [91.218.175.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395AF60A2605
	for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 08:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 395AF60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TnwNEjHG
X-Envelope-To: linux-mips@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WIWob8CPC1BsEJZy81fYICtAeoeG+8SX6viRZjO9vQE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794387290; v=1; x=1794992090;
 b=TnwNEjHGDHf/4d9hy33NMTCRg+LPASjHssOb1iOXg0B7ACIvPbt4VAT/eqxM3Cr8Mbk2169E
 PE7QTn8aMebYU7RYBYfbR/DHIyKbe5NdaTq4gT/7k+OhGC6wBOB9//VcJ3HANVbd6BVxWHVY741
 dA6eB5l+1SfuLREPTS5v+ztI=
X-Envelope-To: linux-mips@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 170e20bcb6536ab6;
	Wed, 11 Nov 2026 08:54:50 +0000
X-Mizu-Trace-ID: 170e20bcb6536ab6
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
Subject: [PATCH 3/7] Documentation: KVM: Fix the function that implements halt polling
Date: Wed, 11 Nov 2026 08:54:44 +0000
Message-ID: <20261111085448.1130701-4-fuad.tabba@linux.dev>
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

The generic halt polling code is in kvm_vcpu_halt() since
commit 91b99ea706578 ("KVM: Rename kvm_vcpu_block() =>
kvm_vcpu_halt()"), but halt-polling.rst still names kvm_vcpu_block().

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 Documentation/virt/kvm/halt-polling.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/halt-polling.rst b/Documentation/virt/kvm/halt-polling.rst
index a6790a67e2058..c311aac1ff9e9 100644
--- a/Documentation/virt/kvm/halt-polling.rst
+++ b/Documentation/virt/kvm/halt-polling.rst
@@ -22,7 +22,7 @@ savings of not invoking the scheduler are distinguishable.
 
 The generic halt polling code is implemented in:
 
-	virt/kvm/kvm_main.c: kvm_vcpu_block()
+	virt/kvm/kvm_main.c: kvm_vcpu_halt()
 
 The powerpc kvm-hv specific case is implemented in:
 
-- 
2.47.3

