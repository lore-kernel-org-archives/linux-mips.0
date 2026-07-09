Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920243E8343
	for <linux-mips@vger.kernel.org>; Thu,  9 Jul 2026 08:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783586846; cv=none; b=grhW7b4gKfYXuWOjjwDLjWItJyWHf+RsqgDHlEPK/SaPXWkF9xNVTK71UetEwod0KtqcWO2oA8qIcswtxer+xt2sGFROCQiexgJWZC4MBJS3GV8v+rQdOar1tXYGBrs6+BBO9fgkSbq64ZoHmHwSuOhQTyycbdAhZKEsjkL52so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783586846; c=relaxed/simple;
	bh=vcIYcFn8wOu64JToHCd3V3ghUBsco6aWxPDuriYHfZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HeKUaaJ4sdcpxQPS8hrSC8dIjiwQgPEIuWSUQzflBeKxQzdLkSp0zVljlqJs6Et20SgcXJwhaBswkIS441m+0FudH3AXwwbc3LmDirA50vkMQZIX/euQEx5eeweq6f6Yz+aoT1ek/WjqrZx/zqS4t2r0LN5W6uX04d1XiMmVMxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-848643382fcso146380b3a.1
        for <linux-mips@vger.kernel.org>; Thu, 09 Jul 2026 01:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783586843; x=1784191643;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O3mkBNkViagFAJs3obyg41kBlrTMtmvpPUP/R2gZOPo=;
        b=eUw3f9e+D+aD8/Fw2TLpsMiJzYZE2hPvYhb0k022xejlk+y+aF0M7z1gv5aTwK7eY3
         cJ5rs49bXgmcbOLyr2NWWruEyTx+AYHGpdX67rAFyqubHQaKgT/uk7FkqS1dLNHibznx
         /y++crws6JjBFkbN/eTZLA957yhc6YoOyWTqdlCmUosEIWlVMObgyubA6sR4ysGhNN2d
         xsDOH2tFBrh3XpJHxylA06XNaSHytZ6fTVd2/p6DABYLGC3nYdKRfxCzHLMuybQFyRpf
         sN7Ugf3k784beCSRsCttKLmMazIHceCIZItK9Nvx57yZPa8FCGyeC3Is/ivmIO+X8r+F
         K2wQ==
X-Forwarded-Encrypted: i=1; AHgh+RoR6CkGdK/FYXzKXTh3CkKJnLnbJwmwzq/XSjwGItLDI13AT+vD1H0T1YTFM0BCR66k1aHjdHtzZvkA@vger.kernel.org
X-Gm-Message-State: AOJu0YxkNrDMKaJrJJX7yn8Sv74LBmPIKpJXar/TlQnRC+iAG+XPZK97
	7u8dwGQ0adisDeCPNB0S0+2Zq9MemlRMFuz1MDQDaqD1KS8065tNLfWDpzecnOyAqnw=
X-Gm-Gg: AfdE7cnVWiSorjLtxbrGG9gqGGUwDpoW7E0mb7l3VFyzs/rsjpanB/Uf4Jctc2LtFe7
	XLHm9SdNXGQ+6PN+yLoQdv/+DIqV7OaQEc86/fQTEyH4c/nOitKgUPrTPd3L4GrbSIQ9PDuCzay
	fjGOTVef8QzaJDNxQX6rvmDU9pv8tenlLXbYyi48KGC9bAHFfM5dzzv3yyiKpGDwtRox17Hs6PX
	OpYQiOiLNdJApP+eIGE5a0salTRyLtT6YH+DpdBxNZJf+pbwF0SIabS1KAUtGQD2yxdc2uL7Utu
	LJjD09MJ1lhcfw6B8ooUKSzUsaFWDeJl93IXQyjcFlVG7ISKvsLKJpGWrhxjN3lUeiESBvw4/7B
	q3GRR/vn/zUQEhoxe96AMdA3dl9IPYPyhCeZei6hXnQdeBw3NA9jvPgSKO4c4+YmRNgsIP8KCv2
	IBzcFV/YWK0ftcxTOzBfisw52EIco8WbBpigo3fglJYwTIBaPbGtWuUwW8UQp93H4B
X-Received: by 2002:a05:6a00:3698:b0:847:94bb:30e2 with SMTP id d2e1a72fcca58-84843410d97mr6434015b3a.41.1783586843408;
        Thu, 09 Jul 2026 01:47:23 -0700 (PDT)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com. [209.85.215.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4d000sm8301761b3a.34.2026.07.09.01.47.23
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:47:23 -0700 (PDT)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso1140073a12.2
        for <linux-mips@vger.kernel.org>; Thu, 09 Jul 2026 01:47:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp93DCSlpnTUBB3B0w/QnI06k37GE0aIroBheWjrVUixzLLvDchEc0OLZhOlaYmeeXXBBm9WPuuMTTR@vger.kernel.org
X-Received: by 2002:a05:6102:6895:b0:738:9dd5:9b03 with SMTP id
 ada2fe7eead31-744e03a337dmr3306957137.20.1783586528282; Thu, 09 Jul 2026
 01:42:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707181957.433213175@kernel.org> <20260707190254.280015701@kernel.org>
In-Reply-To: <20260707190254.280015701@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 10:41:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWe1D0CZrav5h6EhDDbeJzgJcHvT89jrs6109Bdj-pdTw@mail.gmail.com>
X-Gm-Features: AUfX_mw8w2Kp5VuAYozzfDNS6gDbdKhQdYzfXsv-G72F3LS58UBytbGwOmplITc
Message-ID: <CAMuHMdWe1D0CZrav5h6EhDDbeJzgJcHvT89jrs6109Bdj-pdTw@mail.gmail.com>
Subject: Re: [patch 12/18] ptrace, treewide: Rename ptrace_report_syscall_entry()
 to ptrace_report_syscall_permit_entry()
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Helge Deller <deller@gmx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Chris Zankel <chris@zankel.net>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Richard Weinberger <richard@nod.at>, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Jul 2026 at 21:06, Thomas Gleixner <tglx@kernel.org> wrote:
> The return value of that function is boolean and tells the caller whether
> to permit the syscall processing or not.
>
> Rename the function so the purpose is clear and make the return type bool.

>  arch/m68k/kernel/ptrace.c       |    2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
