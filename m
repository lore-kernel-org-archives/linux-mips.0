Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510966;
	b=LbznH5Bz13HNBEskQC2CBIILIV7OB7SeYpHeNuvUmfIQCbQ0Z9wJdFkHB4Mb55h0DYOb
	 i4/B4XydxOFB1FZftg1/vV6J4IkaLm6hB4y9H7dhnRfCrLL0qDigIBt1ZoA+zWFQopBwi
	 w35HOAptluLNzLVQSo4fzz2Zy1M81Me0yI2MY868BVyQb9NziI+VkC0/L9R6ix2wJRxw4
	 FaWVBhipgWL5UZCac+AP4B8xOoUSqJoOPFT+a0dkr2SpyuuJmcGJedXXD4glNCyrC9WMS
	 ZiZrh8D0zFcMdbbJEmwFlC53TGrFRhVzMfvbYDcRJjnQzTDsizkKPYMUo3r0WF9bFTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510966;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=x7avfF8CE7MQkedzx8waSCJsEYoj4qczcsv6b4mLDHA=;
	b=nRwDnCTbokbNtIzG5/Krxu5Q+Cw2nds73LKu5AQOeRlkdpIhbbqSuRP7iw+q1PC/sYI/
	 BhKBDIt9x1CGxNQNFI1oS6u4UOfk3mQg1FDCAV8ktLsQ4LXvi5lGDeR308kuy3DJnC6sH
	 ffz6Hxqg8zZ8rQpQCzhuMEvO8LccOVaeUozLmdb7SkUQe874RIDpGbgedhrbu0ggPJW9j
	 wt7nisZdMHgK7AUrh8O7yCsmqMB1fjzl73X8k534vUiN0hPpEhFQI6tacr06LrD8CKddN
	 UnGpeVso0NvUZuRfw8uoMb/CgSGFdqZ+yd+C755C+Bgmd3Hi7ATH+OMmVArYPQFJZUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6238606A31C
	for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 19:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6238606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5eaaa9b1591so183488e0c.3
        for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 11:16:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794510965; x=1795115765;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x7avfF8CE7MQkedzx8waSCJsEYoj4qczcsv6b4mLDHA=;
        b=XEYmvGQzA2a1psdasa9gwjO+C/O1k+/GtYb6HNn8FP5KsUyKipEH0rlIYiCyGVxC0U
         k8SCYul9ksC6vKYK4zL5BrvDHsqL1ouiRfGHpBx3SvZAS/DHnvMbh0mXdrwdHPK9qP5E
         9aeUBvmc9/+VeZ4PpiOXcuo2mQCqb2b0fKbAO5o4TnH6tulPvCWa1J0LPZhw3GOjqvXE
         J2fUa4wnXBX8G7DD1GCZdDJFBt/O3XsorEQSvobNTx6F7FqXuaLiTGN8KrRemtXmWi1B
         bCq4tw9N9kyI1r3KFsEKstKmxC+ubPLyIzfhG3OtFpyAvhu3aW6DHpDmGkDUvkOJycZ7
         tSOw==
X-Forwarded-Encrypted: i=1; AL+hErEzmJciMluQCgX5PAuHGlZ/jq6OC9c30bmM2l4bTuYngtIhUiCmNbtnhBP06WJddhSaKqMPxJL53/ks@vger.kernel.org
X-Gm-Message-State: APuU4Z/GzhGKWd5MHiQIvwGUqigQRbq/6dEIhOtClxxByMgm2Rm29IMY
	LVSDY+6hLAq72UNz5ld/Mcs8DBiIWohoqED8a6t3qLCqvoGcunKpm+mut7YzFrTQqKQ=
X-Gm-Gg: AYBFou2rOspIzgs3E5pUhigsu7YRJaMmfayM4JCiztLntyTAIom70rniCGQSBlwrP4U
	iZOwsKt3NGocYKMDc+D9Ncp9O1LKlZaTMFhViYCejKqH2jkXCA81R7/5h9Vsr8k9Am7T1RNqk+5
	Gr1Nf4mNgUdbKlwDKjSrYN54+xsdsvZrJJzqQHa7Nj100yIYDAP1+quhs19B0ZdueSQ5GnmVqrj
	D3lIclVrTyYGtUKGiBYKr1vhIFwqc5jXEnq9te85c2c0YxfMw68gD7CxZkACt5LRqhQH9TrTodT
	tnCEcEoDKh7viY8MlSN8ukOlXQnCOqME3qDlzbnQc9k4zbnAJQX1qBGh+SGclCCBjYbXqPTx5t/
	ZVSwYZ2Q+rMmqTGpZ3mD7ajEysPjwz2hZ7D+Mdua1/ylfdZ6QnYUL2hIyQcMJRHZPGuyLj0AiJH
	MUaJoU6DSpAwKaUEsNJFhS9WEsprLLhxEUgXMADI+yKXkaEKfZLGJMEh/r190GVAQwl9w8PYmDZ
	3P+vTzVEPmhwMfOfJjP5xCzjApdlVA2Kpg++MOPog1qjwiu3h3jrjtw6LvjIhlUkn2W+j7Dohzi
	uyYQFw0c7XIrz79a9O0ZsuHmD3Ey2yeY5piNrrEeUKSHdh/I/2+VSaTcSEqzouO+852G2L0=
X-Received: by 2002:a05:6122:8b10:b0:5ea:dc36:245b with SMTP id 71dfb90a1353d-5ee34aa906amr50936e0c.18.1794510964601;
        Thu, 12 Nov 2026 11:16:04 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee3420b59dsm94692e0c.12.2026.11.12.11.16.04
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 11:16:04 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5ecd9a400cbso160376e0c.0
        for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 11:16:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGGibIcgi87FbFXhvOJDO0U5Ms/2KBwYc0FL573R8LpUa4c/zX9vv5QbcqfKZ+Nvim2CxZyWolMo185@vger.kernel.org
X-Received: by 2002:a05:6102:c15:b0:7d2:8dd0:2eb with SMTP id
 ada2fe7eead31-7d64d6ed886mr73919137.8.1794510481935; Thu, 12 Nov 2026
 11:08:01 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org> <20261112-work-procfs-oldmem-v1-2-ecdcafd99265@kernel.org>
In-Reply-To: <20261112-work-procfs-oldmem-v1-2-ecdcafd99265@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 20:07:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUgOGjwOUMxSabUgtaVeKZW1wx78XOJL8joGKkZEj7RZw@mail.gmail.com>
X-Gm-Features: AclHuK8l5OcVstuPYNpoHJ657hIuMQK5i9ySH9sE9lHb16H-lVuh0fnzCqi0JCs
Message-ID: <CAMuHMdUgOGjwOUMxSabUgtaVeKZW1wx78XOJL8joGKkZEj7RZw@mail.gmail.com>
Subject: Re: [PATCH RFC 2/4] sh/crash_dump: check ioremap() in copy_oldmem_page()
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Breno Leitao <leitao@debian.org>, 
	Chris Mason <mason@kernel.org>, Thomas Gleixner <tglx@kernel.org>, x86@kernel.org, 
	kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@kernel.org>, stable@vger.kernel.org, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Nov 2026 at 17:43, Christian Brauner <brauner@kernel.org> wrote:
> copy_oldmem_page() maps a page of the old kernel with ioremap() and
> copies from it without checking whether the mapping worked. If it
> didn't, the copy reads from an offset into the NULL page.
>
> Return -ENOMEM like the other architectures do. read_from_oldmem() turns
> that into -EFAULT like any other short copy.
>
> Fixes: 4d5ade5b29c6 ("sh: kdump support.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
