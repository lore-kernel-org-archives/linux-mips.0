Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387295;
	b=xjZ1JOHOAcdkN8MwcHxu5j0An+3HxadPQLe1vp2Q2RP1gQt4Ysc7ByNiBebdrmYe/WyR
	 IcbtRVD56wHhTv7O7t11EJIFZtruJguvqvKG21RoHe0iQi3iSXq3wFNnTvkOGgBQ0DmO1
	 jcIdhhZZBZO25vW23F2BFyhhkX+c7RxbQMqMCmXqXdpU/ji3ZPbCL8SacPX/8WDlDgX96
	 TSEkJkEwurjrI7c+3qiVHHHlb8Lw94yo1DnkfbFWeXiRsd2/es90bf3VsrRJv7kcchbJX
	 9ZZI7VmhY9mFyqlL1l//UVcmVW6pwLsaPv8JEbM65xKHpNA5uU3cl1PiNxr+MHeCPcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387295;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CrFXQqZImTyTdzq1JyhUooge2du6VO16INEiE6z0KsU=;
	b=bAnjLcP0DVKBd9E4nj83Suz3T8c+P83hOG/NCxB+W5ZJVpJLwqM0yuB9V7tNYHhNXQLH
	 pqi4jw4mN42vq9xDbHR3e8mfb1q+R+lHzmVgxZfG5M8rywDPlGNSkmIfVsNhOcLHDNmQo
	 SyrF+1lbmOGXRY17pl/dovQMKA7bEXsM5imT9drm9jYxV9UHlTafxzcasrFEJKOtPc94N
	 Ba9Tqda67bBFOgDVD+HNPbucAfD3vv6aq+t1v99dbpmv3dvMs/slYEiTNdtxPr1DOuNZr
	 8uBK/zBdV30EFrjgJCrvwu3tH691tgO7PBnjXj3foeCQZLcifVB6m0fmr5NRVWx0Khw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="uCcB5/hr";
	arc=none smtp.remote-ip=91.218.175.51
Received: from mta0.migadu.com (out-51.mta0.migadu.com [91.218.175.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32D160A380E
	for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 08:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C32D160A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uCcB5/hr
X-Envelope-To: linux-mips@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tM7HGf7cYZfxl1BGl3iBn5UcJ++Tp8B1iBd0ZTTM0rA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794387293; v=1; x=1794992093;
 b=uCcB5/hrGVtpBvHrnJdM2LuRh4YtaKk9k6pllzck90711A5v8yv6RRqGHgkfJZ4pM4UhGM4N
 R8ThVIDhOjB2hOiEy8WJEPooJyA1nNYXY1PV3+3k3uK0rY05qROyIAvDYKXSCJeSYmUdNeL7ej+
 QBvVHFG3O3/VKZw9/LAsa60U=
X-Envelope-To: linux-mips@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c236bbaf59a3afe3;
	Wed, 11 Nov 2026 08:54:52 +0000
X-Mizu-Trace-ID: c236bbaf59a3afe3
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
Subject: [PATCH 4/7] Documentation: KVM: Drop the stale number of vCPU request flags
Date: Wed, 11 Nov 2026 08:54:45 +0000
Message-ID: <20261111085448.1130701-5-fuad.tabba@linux.dev>
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

vcpu-requests.rst states that only two request flags are defined, but
KVM_REQUEST_NO_ACTION is a third. Drop the number.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 Documentation/virt/kvm/vcpu-requests.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/virt/kvm/vcpu-requests.rst b/Documentation/virt/kvm/vcpu-requests.rst
index 06718b9bc9597..eedf338d47d6a 100644
--- a/Documentation/virt/kvm/vcpu-requests.rst
+++ b/Documentation/virt/kvm/vcpu-requests.rst
@@ -141,8 +141,7 @@ KVM_REQUEST_MASK
 
 VCPU requests should be masked by KVM_REQUEST_MASK before using them with
 bitops.  This is because only the lower 8 bits are used to represent the
-request's number.  The upper bits are used as flags.  Currently only two
-flags are defined.
+request's number.  The upper bits are used as flags.
 
 VCPU Request Flags
 ------------------
-- 
2.47.3

