Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316693;
	b=A+Ib5r7XbsdriYHKx3P9rYvJ8cIr6NxTYw0dpb9taR4cBSG5vtep7ZJA13dYq5ATM7tX
	 RgHVxmtz92/cIP6+gVnVCOGWET74TEzvqlQh6BDeKnPWuK4/L3JUv6lWbyGvIbMt17+LU
	 HG3WKhQg5MtvrztAiwAzy8Rhd4Ut8fYouMo9j5QcEmcbm5UvcywkJJ4DOM7WGqa252cyX
	 QQcTUZQ7D771n1hKEElzNQJdyp5mbzxm4dVMJmIi2kIHIV1s7YUMKoXo6ANgpq/brNL18
	 L/mc3K4b9xNySSCH0D90jyqxUi1Di/Jg5IWBojO5YLH7FngkLNCeP4ajWAfPakjBCvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type;
	bh=NieCLCvG+gDw8VjVQsEmj+Xb3Nuvde1xSdj6TYYBmIA=;
	b=DIE8n9CA766nMG1Vgvz3lBKBRumTgM+Lygis28NESEZbwzC48Dh362sVi6oxxbgGoMuk
	 QHi0y15qcHihUsuxAQCAEN7i/+KKIn9cN057KN1kLdaK81VpxmTTLrKtrXllt9Q3nVtvy
	 qsDSe7RfT8t5rKjZ2EHEL4+htXWL3FojqEq6sches5amqo3vjWHjzOdsXRkX8wyHdSxkH
	 8NwfJhyBrKUOFC65EojUm+Ht8GSTKuavx2DtwepiWYMHzCoaszdMpKYPWtKTIAMMJnAMG
	 AUgL+2VaJiKOHUby3jyYiOzBN8vFvNx6V54GXYwGloStnXx2LOiEVc6L0537nKuo7dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lQMapLMR;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AFF606A333
	for <linux-mips@vger.kernel.org>; Sun, 22 Nov 2026 03:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6AFF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lQMapLMR
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a315ed211so2712828eec.0
        for <linux-mips@vger.kernel.org>; Sat, 21 Nov 2026 19:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795316691; x=1795921491; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NieCLCvG+gDw8VjVQsEmj+Xb3Nuvde1xSdj6TYYBmIA=;
        b=lQMapLMRecxhRuMkTSymbForunIxX0OPXsGQ1CXe025r/577yULQNYi3TNrBG53/Qv
         zYU80ixAjK16x1kduXUqa1QZW9W/3ti9d/2xwfANhvwcppx94XY1wfu52uKp1wNIi+xo
         0BbROgPXyu0B62JpFc4+zEJIoiLBcGXeP+W6/munvXDcClY8J5U7eqCSCyRjBp3WeH4+
         q1p1SE27fCRmjWxB4WY3p9l7b9yn5x1FejoLmUjB8Y+BhmVh9oZGKVtoBu6VvuhXecB+
         kqHQVq97TpxJ2ylXI5iv8vW2n/kYW3PMkK+9IBmWOkrDx9AQECQxv8quTTJlItW+6/Cb
         tThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316691; x=1795921491;
        h=content-type:mime-version:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NieCLCvG+gDw8VjVQsEmj+Xb3Nuvde1xSdj6TYYBmIA=;
        b=QGuSLGEMqHDwusVQSa5npAnZJ/bFn6To4473OhBCH/MLokWMIkSRX32kUZF5Xjd/IV
         +/bKf4DmA0u5rKACmV+roV228B9NA12EmPYwUr94bqGMbT4PRjueVZNY2DUhWzzu6Ns9
         FsfW021wPC7jX+zjFap+rre0HeLhjBlIqQ7sHKt9G9nbshBfztPztx+xXMsU0rMSK7X5
         hBoE2g50fdce+mMCRBYO7GVxSV9Q0e7NQnMcMN3BF6N0aTfJYUDBICZHaufLc0P7jcJ9
         dY9dQRNDWGUUF/+upF9JmNsxYpgt/0OLe/Gqr37D4vIN9ror++BDddKq7Apa/Ila0IKY
         8b6g==
X-Forwarded-Encrypted: i=1; AL+hErHNhrGJzJcBpWh3y6iwJMTF4xCvHj9t7YNQiDlKQSgLW5JZ5VhDCJn+8Z661O8GmdqoDCd+YAFKwFOV@vger.kernel.org
X-Gm-Message-State: APuU4Z+msjJhCgpguuUFGSm04Yv9NdjRCVwUK7q7HJ5VInvWNV78qhVY
	Qkj3Dx7nHBLwhPOztYFruo8pS1Cr1a9arZsSzN1KNOQa1eaLUbjHO6tR
X-Gm-Gg: AZFdTZf1mhM+m5kepbNSBad/hTlvu1Dkb2HqktcOczWufK0W62AVB4VOsnyfJJqQX20
	QtHFbYUL8ZYs24uGx5+jLQt04W8vZP7EMMfjZTGQn+OhdA+3T8ugWi5KgbxmRUV6Av42ELfAD/8
	vs7wIzPS+59/5qvP7FkcDSQnz0Hk9EcVsjxuEjGS0yz9u3kiX8nBZ+0gGYghx9k9dH5HDO/Aw4R
	8uu/FDE/XqJMmuqJfQ9sbl3GEQc0L+H8JYtd/Lntu2rC9FS0fzNjYt0LG3sGTmoPjQY8mUraJcC
	ImfnYC9X9dFJEJcJjcfm+RYeuiuJ8//ynqxjxbE3mF/ZsKoEIEs6Oyfl3REGJpUoZU8BvhCig9a
	NJ0n7x/un0sGdY93YZKEyRCTbcuNd0Iii5dI8lzj30Lr9knzboKc6NhG78iYfgKpj8l1NAEdCqz
	LllVK67fOnYA2/LWbwUnBdipT+Jy13vU4wG5B/pIRqI0Oxt3KNal+xLBoeIVgw7MM5irYhtRzX4
	gOTkZGWCbzfPEbb6w/ZlExvWm/hSGYJVfc0rvRezyz7fZ4utPGcWAmwh8wC7sD5XW9tiHARCvw+
	P3uInrh5ZkLbcm9GTzeHO2pCr1BLLOASj8h8gokgk/opwx8T
X-Received: by 2002:a05:7300:50fa:b0:383:9f52:e54d with SMTP id 5a478bee46e88-3856ff52e83mr8869235eec.8.1795316691531;
        Sat, 21 Nov 2026 19:04:51 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm24302948eec.27.2026.11.21.19.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 19:04:50 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <baoquan.he@linux.dev>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Paul Walmsley <pjw@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, Rich Felker <dalias@libc.org>, 
	Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>, Christian Borntraeger <borntraeger@linux.ibm.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Cong Wang <cwang@multikernel.io>, Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 2/2] arch, kexec: declare kexec and crash capabilities in Kconfig.kexec
In-Reply-To: <20261119-arch-kconfig-v1-2-37c276fe4d26@kernel.org>
Date: Sun, 22 Nov 2026 08:33:10 +0530
Message-ID: <wlq5k1ox.ritesh.list@gmail.com>
References: <20261119-arch-kconfig-v1-0-37c276fe4d26@kernel.org> <20261119-arch-kconfig-v1-2-37c276fe4d26@kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"Mike Rapoport (Microsoft)" <rppt@kernel.org> writes:

> The options that let an architecture opt in to kexec and crash dump
> features, like ARCH_SUPPORTS_KEXEC or ARCH_SUPPORTS_CRASH_DUMP, are
> defined in each architecture's Kconfig as def_bool, and most of them are
> copied over several architectures.
>
> Declare these options once in kernel/Kconfig.kexec next to the options
> that depend on them, similarly to how mm/Kconfig does it, and make the
> architectures select them instead.
>
> Selection conditions are preserved, so there is no functional change.
>
> Acked-by: Baoquan He <baoquan.he@linux.dev>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

No function change observed in this patch (as described in the commit msg).

LGTM, feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com> #powerpc

