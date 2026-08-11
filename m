Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C3B3ACEF0
	for <linux-mips@vger.kernel.org>; Tue, 11 Aug 2026 06:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786431401; cv=none; b=k/Qe7ioCgy5yONoM4VDDA9ckNoXYLxwy+5Nlrsqg2tezDnufyCS5mzV/y0/dXd5FEFbQ2FNOHyyN6dC8qNf9RPrSpbolLHIeXJLBgbczbc6XwNBA1nDWU0aQS3KTRz+pYl+7axFSDmkLIZ53YMKSWVXbViBjfS2Rl++02Umemk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786431401; c=relaxed/simple;
	bh=tZZLV6eyiwcGv5N3oyI6rD0AMUqGK1dWtQ5SUdhqr2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=itOtiCDqea8mdeuWwOoV74vi6NQhEE7ejZNmf+v2jJ/ACB1iikzA2mjOqyuE3nCGJ5TlOpIHfXcPuCNRc1aXwWNkl09OwpuXDoHBYSYXtJURyifOPCi1NpCee9vGRd/77MZr5CFoKXxrhg6SXHCmVxBQYRHqen8XBbs1ZGlX2LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ce7d2adef4so36293645ad.3
        for <linux-mips@vger.kernel.org>; Mon, 10 Aug 2026 23:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786431399; x=1787036199;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0iZRfAdzYvTsaTTh/J3ab87cNtJMKi7JiQC3Jqumorg=;
        b=Ipi+nQZ5+Zl0i5XFYBZRNNcJu7X8Ss8W4LOuANVbvbj6koxT5Vpbs4QyGxjhUPIQ/L
         3SCpasdMkc6xZd0eZd81SES2OM16+hhJiA43HwZascIVWP3Rbmt4GAuLqOJNY0iyQLXn
         MH1WFjgXYo1jeTWhKrCxB/Vgu1xGb6uX9QGy6BC1FF2dyKyF5TR2uQefenaan0jfCKiV
         2OUecdsxfZH8rxuS4XJnMWRFLoONGcqqvIy6TR/Yr4Fn/WPlzQBrQ3JImHobjiR89g7j
         hPi6Mh2kHjQ+p3sRpcDeIaXX9sn7CQEr/PnJ59tURuQ8VWdFKRyxLHID9SG9e++lqBTf
         mBsA==
X-Forwarded-Encrypted: i=1; AHgh+RqcsaoRNgBjOEtHw7lH1U5T055/NHiybsGDXj8rwqoSR7eQwuv/eWzxYhHQpH0jxLQRGXkxIqB+/TyN@vger.kernel.org
X-Gm-Message-State: AOJu0YzoaZUm8zlEr3+HiLHcBtizGC6BUAZe1DEOnXqoUWOJQsv7qQna
	bZnTEnZZW7+/BgRMTo48jA0YjLmKjUjrOC0jlAp1aoF8nXpxJ4/LVjsijU3YIXvj
X-Gm-Gg: AR+sD13MbFIbawae+QSZaWF8DYLYcLYZ5hYo0ZrZRQ7zQZtvtihuz4UKYuFvx5RXsi0
	zU7Iy62BUJGPSnFqxXqAdQW3DgCMvFigM+pwrS8oVn0nQ+/mRAPZjRdKO4gKwjyhCJqywrRcZDr
	MM5EnbOqkYbK0OYpo3+nHgCQcC9AiFn0ar2lJPwpesWDv4L1fp6sJ0WKBine1tRUxCWq62h1tgP
	Gunz9xwuC9B9rpMRtb2xNXTzcif/RywHj/TdtEcn6Igz0KXSiXVdjlP5zZBB+nE9yp07UXrCptR
	pHAEGVEbKPiL1z7zLlPgP9rZAwRG7EQU6Iy5MAR9GiIp4pBOrI5EXwpnw/v0CjlSkT82/0+gFvW
	KqtDTtNQ1cqAeqdv0B9OPwn09IPVYnu3uUEQK1fzf2znEoxMMfBOU02VkXFpq/9f8x23kaiCW5z
	liglgl9F0Sxqef8p/TSqndc71C0AQjsq2E5AY7xgUiaTHkKpjap9UefCxzavwk4d8a0nBwV6fb2
	A+G0r+hPa1twviEZ4dEGQOnLi4lFg==
X-Received: by 2002:a17:903:37cd:b0:2ca:a03a:29b2 with SMTP id d9443c01a7336-2d3177c84f2mr17397395ad.8.1786431399511;
        Mon, 10 Aug 2026 23:56:39 -0700 (PDT)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com. [209.85.210.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315ef0f42sm2723405ad.14.2026.08.10.23.56.39
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 23:56:39 -0700 (PDT)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8487214ad2bso3568741b3a.1
        for <linux-mips@vger.kernel.org>; Mon, 10 Aug 2026 23:56:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp6pH1LIUwhEQolJbbcuFRY+F4BoW03xXGgjA+DfaHv4tp6MF3LaudWSMyfyCTIxo4EX8RqM1FTEpV6@vger.kernel.org
X-Received: by 2002:a05:6102:c4a:b0:738:ecd7:1984 with SMTP id
 ada2fe7eead31-76b54a7a17fmr283026137.3.1786430995503; Mon, 10 Aug 2026
 23:49:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811042119.3652929-1-anshuman.khandual@arm.com> <20260811042119.3652929-7-anshuman.khandual@arm.com>
In-Reply-To: <20260811042119.3652929-7-anshuman.khandual@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Aug 2026 08:49:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfpkpYzZWGVb0fQrdn3uYHU3pyCkyAX9o2ux_Jj=2ByA@mail.gmail.com>
X-Gm-Features: AUfX_mwgji-OqM2d70As4nCfmG84npBMa5IuhuEcV5XEKzcXYS3fe_Pqx16lD20
Message-ID: <CAMuHMdXfpkpYzZWGVb0fQrdn3uYHU3pyCkyAX9o2ux_Jj=2ByA@mail.gmail.com>
Subject: Re: [RFC V2 6/6] mm: Drop pxd_ERROR()
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, david@kernel.org, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Anshuman,

Thanks for your patch!

On Tue, 11 Aug 2026 at 06:22, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
> pxd_ERROR() has been used in generic mm just to print the page table entry
> in pxd_clear_bad() before clearing those out with pxd_clear() later. These
> pxd_ERROR() macros have been provided by all platforms which basically did
> the same thing.
>
> Make pxd_clear_bad() use recently added ptval_to_str() instead for printing
> page table entries thus completely dropping dependency on platform provided
> pxd_ERROR() macros which can then be dropped off. First move all required
> helpers in core MM into a header file which could then be used else where.

Oh, the "x" in "pxd" is a wildcard?
Except that is not, as it does not match "pte" ;-)

> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

>  arch/m68k/include/asm/mcf_pgtable.h           |  6 ---
>  arch/m68k/include/asm/motorola_pgtable.h      |  8 ----
>  arch/m68k/include/asm/sun3_pgtable.h          |  7 ----

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
