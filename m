Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CF03D9689
	for <linux-mips@vger.kernel.org>; Wed,  9 Sep 2026 19:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982709; cv=pass; b=DI/Nrp0Yhgmf42DE8SEEOPgP7QkDJumz6pEvguBdrBzA3KvH7We08VnnZ8gui8C/vlEkZ4l/2u5tfanhrrNmMS6hl5vjFhHNw6Tt0VDQEu//OzDpZb8WvedwUFUWMnKsCcZPOd5yiLuNAQb813i2tdjIwmJ8z1Y0/TXQ/tsYM/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982709; c=relaxed/simple;
	bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ROnuLeTdhT4niFNo/yqVejEEZH56SiM/RHE50LnksSn69sZMX75KxJSfstwZbvDGU/uLtUQiNJpeFSp9XljhaX5E+1G7uFedbdtKtZ4Kuz5djYXb874Xqzqz2vhh5UKf2vu4X7cvyTrW4WUJIndK3MQ88EYMb4M1FtAE16gbqEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9V1mn82; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9V1mn82"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666bed441so1081012a91.2
        for <linux-mips@vger.kernel.org>; Wed, 09 Sep 2026 12:38:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788982705; cv=none;
        d=google.com; s=arc-20260327;
        b=YdlZ3/mCFyLN18ZgpKqkCnpUNmkUW2c86xJlsnbbwlFHE0wjtNTI8eJkD8gfh3LSwC
         Lru4MCl5twNgP4CutwW43a5RRNO6ab0WNRP36EEVCRoyHwarzF0UgOP7LRA52ePu51rx
         VOAUQeFH9OlfpHfckYyIYJH/RSRBUw0opM5T3TXVPcFS2H70iY0GhEBIjuwZdU3I5OO9
         oW6/wljMVfflNJw8Ggxf8g2C4ShNQQTccvur0RPbtM333Da2OlsSELo3xc50/Uhifnk0
         eGH6LqWBb/VjvFsKEggIS2bOBlB7gel2VEKa8b7VpasP+/5aUHUFxMqAfGOzwOU642Dk
         21WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
        fh=G2T1jJg0O9UDYkXhyfiTBEZxxccvJ7QDI0K5pzKeLVw=;
        b=ZE0Z9GFyfKhbH/M31z62AwXErkM5NihqrX6DWgThrs2P87KYqLCcbL+EZ66iafFqMf
         +ZDmaLbi5qXThIPKQunSabH9INjLtPhxmlF0KBFQqpcTzcqrm6zlem2f9Cc9cEYL/elu
         qVzZawZ5n0jSLy45/oaWQs8nZTHwi0jvxFHJdl4nxvp77H/tqrmxBVlYCvb4BvIr7KuV
         49Bqo0hbVNs1BnPK5at2SUoS8EreCuOzMSsXHVioEVdDDcBz/sFuntD4Jv58q4H1mecx
         KVF/5rv5MVK14yORtnjfsHF2VBLCF8xEpPlTnvWIZhBdvY1GUsV+GRyt1uADs3yKyD9Y
         xnyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982705; x=1789587505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
        b=O9V1mn82dLJDJpoWkpJ3uIqIF6FnMmw8HKITWUuf0+5gF9tsWFQvJeqtuvXWVufZ6M
         WV9sS6d8PY3FlMamLDg2/HWYu2ToFT5hITdCpWxDuCc+cL4fMdLCp5VGqvUOnJ6dXJ8C
         8hPDf0onGOvKjlaqh834XmZcICJPaGL6gkNzUTEND5TaAJdRp8B3DRjO8U5MgUy+VG/i
         vNUxzIuRGbgs/dQsoZjiOkN7PDRGh1JoMmOGgnGAj/YKMASmOnNmAK7yaZfExInbXu5a
         EyCvSXz88ovLxnHrYgc7y7jmMl60j4R55wVeecNSwYBDDPcZ8AeLU6oDoA0MRQqGMd3d
         95Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982705; x=1789587505;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
        b=c2mo0QH+Xn5XRKc3iB3QEQuXMKymx929/UNO1tDx21h3bPubNIP3edyxdyIiPiBKFD
         enk7AwNTi0BpRkcfk2hkMkJZBJUCkLNumpsgAsCypw746BgHgMWnUy1O+kihBshk5pwQ
         9Lvfkap1Wbw2nnsRswdE1OkncC2JJUJCX2UQon+6r5xhOV6PJ/grsC0nx6v8/aL5Om91
         3vyCPnfpPzJ7b91xvJo/Qx0yTVy7YSacCfUdqnB3G7rGp0dR1ZTQfdfJnu5pvh8Ka+tm
         hklwmV4WaKoDTOa5EczefG/ne476YL3h1bKx84JmY5KPF98g8FA1FJXCbue1y+7WDU9n
         iU7Q==
X-Forwarded-Encrypted: i=1; AKwUvBygKi6XJuWFXe8XsWcd7E5ROmHMerNSSUd/8PD84hmKwwaS2MRkRHzt63guGn5i4V4keYTlew6efe9b@vger.kernel.org
X-Gm-Message-State: AFuF++mc3TPshc6y4gIoHjWze3uKQQoiac0e/VNQ2y1knghu7AHbz5eQ
	0WFV7oDuiXSKqq9wG1jelP07OfkdkzjDGp6IqfUxLOIgIZNcvthQKbVgdFCCaeZvXZnK7kxvQIb
	7JT2ZAyeYYlpAsrHloMa5BvOLcO1t3gM=
X-Gm-Gg: AYBFou1jyxPDYloqW3+aRPk3aVP5ascaRR28Dap8411ZBG7u0hY67EGafCd864qHhby
	yvHR+VKkQxk0egfOS1/oDFehuIm20uhPV0ipV6kBlKYPGsQ9oyoyXHMGDgDJD8iNHwzr70pIHlk
	tdKgZRE01/EiXhONtNq9ZvSoOI+Zk1duwgJvOaqYFgwtp4Yt90h9GYMw9bfoIeIrF0UzJJet4Ia
	6VvCdm9hAQx4Udh3bZ9bwO2OksuPfYUxqbgPRGB0mCinDdomT0xSOtxpbpNUzEBV0NOd8Ut1/np
	hoNfhEjhsLK7oHA6mjCSs2kyvbRx6y37NvWmN0z/qNkk+XLws0ReEb9eev0PMgmUmVIE3xFPcCn
	04qyYbCJSy4+7lISPd4tx8D8EFM7WqdpYdJIbv2A8m12itci9iDWtmUJ6JFkZdD+pbwR2lArena
	IUn2SDlvTa5qvQxTSfcIrhHNZ86wrOovsjJJ9gvP3NyetyWs1WDOY=
X-Received: by 2002:a17:90b:3fcc:b0:39b:3505:c72f with SMTP id
 98e67ed59e1d1-39d77b83048mr824934a91.6.1788982705356; Wed, 09 Sep 2026
 12:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de>
 <20260908-vdso-absolute-reloc-v5-12-3a93791af1cf@linutronix.de>
 <20260908071911.GU4120091@noisy.programming.kicks-ass.net> <ABBC0C50-847F-406A-B426-55D0C2BE15EA@zytor.com>
In-Reply-To: <ABBC0C50-847F-406A-B426-55D0C2BE15EA@zytor.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Sep 2026 21:38:11 +0200
X-Gm-Features: AcwNN1V9A4D3jn7pum7crGv8bcA9jfLyy60O95H9hOe-jZGhQ7AzCwKSAv7z5Dg
Message-ID: <CANiq72=T1487Y7TpAa4c2eTJFMLHoe5Qc7+tRkbkmvrDjfmuvw@mail.gmail.com>
Subject: Re: [PATCH v5 12/24] vdso: Add the vdsocheck tool
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Jan Stancek <jstancek@redhat.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 9:33=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrote=
:
>
> It was going to happen, and now we'll have to suffer the instability of r=
ust...

What instability?

Cheers,
Miguel
