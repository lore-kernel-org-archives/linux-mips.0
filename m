Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073794;
	b=PSKL5wAqNYRdRYPhhT1CliW2dZ2pjRFexbsrtXx6jIFcfHLHoJNJtmVUS5HuiDONur9h
	 ckJqZ4arAARltiz+QVkMEKOtmbnx/LQqK3LwC8H945ZadjVYkF1QnaibzdguvOEo8HeR+
	 CHAVfIZ3h6r5eWzeB+5tOugzvZ8V2/hgFRr9mi5GHAoqTEKTLylAYTUsoy/1caFyEMwKk
	 xmG8CpfjvH7fF8mJTS8icEpYi5nBda+C+8I2EzCqH2jTFNNTlGmneHLSlYJttZ77xXrjX
	 sNf1SfUxo07WLPd0HEDpHsbwf2CZWzK6zrzLFA7/Y3EEEn0aegn8/3RalfbHB0UaEnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073794;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Klcqtq67J8++CxJ47wWJ4KmRtmeIU5oN8tRyALYYbAY=;
	b=LxhJAIKFhsuNcWOEtlDtdthoGe58oLqRdTDIeuLP/XV3xlshofqCu2txRNSaLs8VLy9z
	 v9/Nxv4/XdraOBDL5xPHnhqbUdSXmbGOAWm4DcLRDLRqW1JZonpZ2klD5NMgOD6uEJ3k7
	 XCkDuNQMQrFzTv55yvbnx9+zZ8RGtFhGDOfHZXIQaW5jj+DG8Q8GNdc7gzfZFp540iqZe
	 cL/VR8njzfShvmnxRu3oF1F9PTHJrwajmVqXKcY5ONC7JwaAGoIpPpupGOE/xkSypY0kn
	 fcqwUnjho192WM6ITGWNbJQKGZ8iIhMft6PxgIvQLoBB0uXnnOCGfJWTID0uq8tbUwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB89606A320
	for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 07:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDB89606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-48ed0b68895so1272769fac.1
        for <linux-mips@vger.kernel.org>; Wed, 18 Nov 2026 23:36:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795073793; x=1795678593;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Klcqtq67J8++CxJ47wWJ4KmRtmeIU5oN8tRyALYYbAY=;
        b=Qi/T/cilzOea7siVmaFeuLAfZAeXgQxn+fxAmnNiTkrnj5XYzjVokgKEP/JTGbyNBJ
         UD/TYwRLNNmF/Js0n2YkgxschpDjN0EqhivDBt+V3MHv5qyUN1EMX8eBoIz07oIFVIaQ
         J0rx4fc9hRDwvej9EJGWOchZ6iX1sySVD0rig2CnEXBcfkNz6biG9peLMCHKzoRrxAxg
         XWQhc091TGoRUYMIBKrkcyU0dMdqrYW73Iz6T/9BqQo4dnnu1LQ+a2n0K1pwabEj1gHc
         Fh2sX09M93MYxJ3DZBakgBSAz8dnF3NE+L+iIX3P60/2HF+6dEOboONinDp6EXHqNxZV
         cOmA==
X-Forwarded-Encrypted: i=1; AL+hErFCltZWkI8XCGFnA8zMhAFtS5j2yd7tcrCvc0+qEoa0U+cmC23EGPrAeLTifPnh9yFS7OaePnpeMlRF@vger.kernel.org
X-Gm-Message-State: APuU4Z+LzP5e0QysmIE4xmpSPz0lCkBzH1Ig+hjCTFlxMFB4v33+Lay1
	b+uzlEgGaHFW6P1f22tuBqdGEvKbivOgnqSwpNdrHgaClL2kgmMgJR9IsbfxELjT
X-Gm-Gg: AYBFou1N0Na0xeaCUPqd9+xzLkS76FuN7kPnOmOgv+CNsg8sRNFGIikH4iR5Batg7Es
	i9lG2+NpOc41WUTJVYEA8w2b65UVsW38oDnkTqGf2/Rh2GeIv5KvH3k/yhAcNFbnJ4C18ll7PFM
	VmDWPUyogbMei7FuLlAO7+kRkZtESy+Kgsy7mO49rBC7FUKxWV+TOCj/SZbHlpaBxqh81BwTRMG
	kG/quSVIuxORkCYdOYO/zqRgga2TBCUmRUG5LE6Qs3EAaYCk8CJIweZ39wU+q+qYuryaWOyRQ1G
	8Atfvq9P6RmWdwEQvJE+Xn1PBCG3vAAUggFa0IcgYZgi59sr22zU4K/gnRQOQx1yx8TJ8R8cUgA
	LIiKGhoJ3QOVvzfIK73nSfWHMuhLmjbQwtqkw2moFa77GCywbTVNvs7yc313hk+xLfv6Cd+ATnu
	VP974i7agF+HYT2bPz7QsdVaAJq6OSoIQdyDVLx+kMF2uAi6CP+MPAEjQqG23Csg/plvoWbPIdT
	12C9mjvHSc3eEPKNqKrJ2Wp6LO+qLFNHVqSFem+YbQYkl0PB+8booHdc+/nPnCcxS34b3KTgcl9
	vEZfIHv5TCUQIuTxf9MjUK5A4BmkJpQO8REOyI76e2KuS2M9bm6qKIWTpAfqtWWgVyzo2UwoBkn
	Z7D5huhBkceLW
X-Received: by 2002:a05:6871:5826:b0:439:a524:a29d with SMTP id 586e51a60fabf-4b75b5818d2mr5103835fac.1.1795073792583;
        Wed, 18 Nov 2026 23:36:32 -0800 (PST)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com. [209.85.161.48])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b73a003714sm4497083fac.0.2026.11.18.23.36.31
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 23:36:32 -0800 (PST)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-71ad047710aso1279052eaf.3
        for <linux-mips@vger.kernel.org>; Wed, 18 Nov 2026 23:36:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEp5OpTFsaDmkVc/aadkTUvzu22JZEpCVE48bZ5A2vXxlAPdwyHK78rLcPTygnOo/9e9WbExZ4vcQfA@vger.kernel.org
X-Received: by 2002:a05:6102:e0c:b0:7b3:8f0a:f76c with SMTP id
 ada2fe7eead31-7d6ba35b7d8mr1806982137.13.1795073401089; Wed, 18 Nov 2026
 23:30:01 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-arch-kconfig-v1-0-37c276fe4d26@kernel.org> <20261119-arch-kconfig-v1-2-37c276fe4d26@kernel.org>
In-Reply-To: <20261119-arch-kconfig-v1-2-37c276fe4d26@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Nov 2026 08:29:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU2u9wDiqp+H-aDWSRcT8_VtDg1NS0gVmqYYm9rt2ZSrA@mail.gmail.com>
X-Gm-Features: Aa3M54rf5ygj8ORK3fy8Y6Bg5UcrfzvYekQ-eoJmIgxSYs0ZeBrecHV4-2jERSw
Message-ID: <CAMuHMdU2u9wDiqp+H-aDWSRcT8_VtDg1NS0gVmqYYm9rt2ZSrA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arch, kexec: declare kexec and crash capabilities in Kconfig.kexec
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <baoquan.he@linux.dev>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Paul Walmsley <pjw@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, Rich Felker <dalias@libc.org>, 
	Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Cong Wang <cwang@multikernel.io>, 
	Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Nov 2026 at 07:17, Mike Rapoport (Microsoft) <rppt@kernel.org> wrote:
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

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # sh

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
