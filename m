Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815911;
	b=SFNQ4iaVO0rNrSJsdgOSs/7o/od+qVBUN0CUK+qjsI9i5f4UKtf30AI1wZUYzr/iikCj
	 7QctEni17syNLjAh+pLz/qhmD/atTqK9+1+fqgOC/31D6HNPgyNlDZGmI44XdPC/9d6cZ
	 FzddXkgKrfxlgMD1PHyoNyjrW1CQX1XRbB96cA02N1NJnkkFtAANvvpf2uEFkCu/CYtJC
	 JEKOYc6LdWDgVO3EvGBZpOQCUIFz6g1VouHdsd0pMaOD671YUar03/zyoHvfcZAZc+a4z
	 qkCbWzw+MseGmWQ4LWYyr/Uezg/gx7IWkeGVCk+eBCHZW3u+ciOItG/4Q/QxAbM0p8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=MJ7d3rNHeUtNAkSjUSjsQ3HRQiSBTnNiLXOBSu1liKw=;
	b=MzEDQXmVWA68rL93HWen0YbBbJ0QQz+kI9cmOKwuwbBpvv2dIDNw2olZTuz1/8vi2pmZ
	 yC1HKFbmfSeVR0JWvwmhnbBkS/XYFwQGJcVlDEVbPDKubrskRVYkO/q0qfM+bBSrlvOBz
	 ETRWo4bSwvdcqqFoZKN4y8kT89TlkpcowxcXbVGPXYY9zX40bATDVrpNufdyajJ46ycBa
	 42usyQ4eAJF2acITogTDS2uwC1g41svBJvt2XE0Ue1CjzlFEBUxQNzu3gnxhkVTeBlvV1
	 egRyYtbFKnyodsC9/cOIHwbvvezjijXdmfUkeo+LqkiCM6UCUx2U+Uh7jB/FWr6iWYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RZwbcCo0;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C91B606A32A
	for <linux-mips@vger.kernel.org>; Mon, 16 Nov 2026 07:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C91B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RZwbcCo0
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso1157161f8f.1
        for <linux-mips@vger.kernel.org>; Sun, 15 Nov 2026 23:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794815909; x=1795420709; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MJ7d3rNHeUtNAkSjUSjsQ3HRQiSBTnNiLXOBSu1liKw=;
        b=RZwbcCo0a4gjuV18T+2Ucnw6jCdsWPKRC5LMIQkGS1u3K0j0E8r+eXQHgwhpFjV9Ns
         E4eQbhZlMF0oYosxibPqVnuTLzKDIZ56ygSzOKMLI0U3HdyWkdsGQRg4ffVVNprx0lNl
         3VoShnBY86Rw8ivEwPnvAve0hmIwWUhUt2ZoXiWAG5yImwJfbTo3xhtFN5I/MYPHtn4b
         enxL6PfWiyWc5q9d46A94egMlP3knZPlBbquGKVnCwHFNT5Fsl4ImTFxxiA9tP+r47o4
         8TQ7tud9tTBHlzYrfDmF4FaRvuovfFXjlIwl3BFIwbrGT1RvY+zLOzg32pd1vrPaiWJ/
         fCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815909; x=1795420709;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MJ7d3rNHeUtNAkSjUSjsQ3HRQiSBTnNiLXOBSu1liKw=;
        b=xwzKiX9pYM82G4zffzROLSGAlNnIu7rCGAE8HQkvDin7Ue1oFjgz04awrELtSy4qA6
         zZyrfQGcgDjop+oSo69ABCZ/4MYRNt+N6wSE8XEb1750e3M97C8ndtOT9JdtyvzRAo2Q
         z1T77KNri1AhC03hc6imh/HDgx5ddjvTAzfne2CnBqAf181R5q5dD4rtxoqk3izPOmZ5
         4tTF2pVLdbSYA4FKDDO9Rf+yhF2MZfnnSRqMrgxF1Vo5cOecKLKCwXjQnVu+fB2k7rrx
         Dl455VVUCfEz85h4oIOZ7Bj8q8E4wL3h+nFq7dCgyjIqV7WVjAJAa9eIgbH4XtXJBi8o
         8JTg==
X-Forwarded-Encrypted: i=1; AL+hErHodaYvD6ClSORiulWsflZaKkeUpcsZpVY2XqXDVYGlGsfRq10PYh6TbSnM1b8qewFV8ii5qcFPz/w4@vger.kernel.org
X-Gm-Message-State: APuU4Z8mqOlPcrc2g8salNgisbYL6V8H+HGlGZl9rDsdJP9VM8rWWrV/
	shQis2Mr9iNmTsAjn+mIy/x6P93LYySkCkebyLPkdKGldmySk1Xx82i/qDGplCajUeJ+
X-Gm-Gg: AYBFou2b6sC916VE7JvE8obHiuMSa219kaQuipJyJy3VFpE55vylzDqQQeKW30eEuMv
	jPx1YPZPCm7TBI49XqSSZ/bqeMZr0hxnuWxtgOCCCQoKSoWcxm35Q7aElro0vo05ZbfRSPX2AMZ
	C4QlXUpGKoRy+U5Sy+KoRT1T+kbqHze2dmmFrL9bpSmM8FVNNcPs2v1rmxYVV90tmqySCsQBTZ+
	2T6bmsx2nf6Sp/GSuA75qjroiJQPPjWSMC6qWsvEMkfjQjvgjghJoVfpebEBlCA/mxG02h57kaB
	gf/6hJrVNt+S6tR2dpDztWXfvnsvpXCWxH5RlOqUUlxEKWLkvrl6h1s5fuaGRIXP6vCE5V8yIKK
	y+nNVzSxL0UntOQ7wDBpYCIMWgaDq5aOvNqwz1TP39zDOaQN1HoqWilfsHJAWStV/wmuaF69eqf
	vgFoG21kDV3P9esOSCyqqW8y5I6dgbN1XgjdxcurmAnjkiJOb4xdK+2cHZRnpfI1dKpeNcO9Tjw
	3JM0+6qo6uVx7Cqhsj9gOwm0dtxlob7wjqJRPdxn9ltGUd94J6YDODdo+RbZHrCLfPTVvYze5G5
	3ty2ilYGK1ASZ2v9ZHb7tjfrGK4+GVdabQ7334EAHzBSpG/vZ7dSAU6Fy5jtc64=
X-Received: by 2002:a05:6000:3108:b0:48d:f9dd:e3de with SMTP id ffacd0b85a97d-49c7353c415mr20084703f8f.45.1794815908942;
        Sun, 15 Nov 2026 23:58:28 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2be55sm21124748f8f.28.2026.11.15.23.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:58:28 -0800 (PST)
Message-ID: <19b4c35c016a91302bf6bc3380bfcd3d21dc50c0.camel@amutable.com>
Subject: Re: [PATCH RFC 1/4] powerpc/crash_dump: check ioremap_cache() in
 copy_oldmem_page()
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Breno Leitao
	 <leitao@debian.org>, Chris Mason <mason@kernel.org>, Thomas Gleixner
	 <tglx@kernel.org>, x86@kernel.org, kexec@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>, 
	stable@vger.kernel.org
Date: Mon, 16 Nov 2026 08:58:26 +0100
In-Reply-To: <20261112-work-procfs-oldmem-v1-1-ecdcafd99265@kernel.org>
References: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org>
	 <20261112-work-procfs-oldmem-v1-1-ecdcafd99265@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-11-12 at 17:37 +0100, Christian Brauner wrote:
> copy_oldmem_page() maps a page of the old kernel that isn't in the
> linear mapping with ioremap_cache() and copies from it without
> checking
> whether the mapping worked. If it didn't, the copy reads from an
> offset
> into the NULL page. That oopses unless the copy happens to be a user
> copy, whose exception table entries turn the fault into a short copy.
>=20
> Return -ENOMEM like the other architectures do. read_from_oldmem()
> turns that into -EFAULT like any other short copy.
>=20
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: 54c32021eb6f ("[PATCH] powerpc: Add arch-dependent
> copy_oldmem_page")
> Cc: stable@vger.kernel.org
> Reviewed-by: Breno Leitao <leitao@debian.org>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0arch/powerpc/kernel/crash_dump.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/arch/powerpc/kernel/crash_dump.c
> b/arch/powerpc/kernel/crash_dump.c
> index 103b6605dd68f..1543917bd3e1d 100644
> --- a/arch/powerpc/kernel/crash_dump.c
> +++ b/arch/powerpc/kernel/crash_dump.c
> @@ -86,6 +86,8 @@ ssize_t copy_oldmem_page(struct iov_iter *iter,
> unsigned long pfn,
> =C2=A0		csize =3D copy_to_iter(vaddr + offset, csize, iter);
> =C2=A0	} else {
> =C2=A0		vaddr =3D ioremap_cache(paddr, PAGE_SIZE);
> +		if (!vaddr)
> +			return -ENOMEM;
> =C2=A0		csize =3D copy_to_iter(vaddr + offset, csize, iter);
> =C2=A0		iounmap(vaddr);
> =C2=A0	}
