Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9E13F4DDA
	for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 12:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478732; cv=none; b=HJWqTrb5hRNhqwhi0rjiWXSCw6YJ0jE9ANtYCWYjACwtwED6U9aZHPkHUgyHI0C7/kW/oDjQLe0AesnMTqd/Eg3TEXLcJ+Ek7EwRDwjvINhnW3MvLyx/1zRe1Z2gBNU1sRsnDOHJf8UfDTDQ9z1e4UEOf/tACjsYSAfBzriaung=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478732; c=relaxed/simple;
	bh=OS91UUSE5LjqEHkQaRweTDP8uzELw0+MCj0rXMg2npg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DTzX9GeFr9O3mgrbrSEkFlkRTnUNpRzIhroAlYg0AWSlMmfTXkQ+4ovwA0g5MwDVtuiP+kmqJO2qU4Hf32zMMcapB66EXIn5eMh1HtNBNOjGc03lGn9tOk3AaPuLBvhUZzBWLZ+NfCxVzx/4HjjUjtmAiLVCIJOQApsuso8JAr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqpwkTao; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqpwkTao"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB52C1F00A3A
	for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 12:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782478729;
	bh=OS91UUSE5LjqEHkQaRweTDP8uzELw0+MCj0rXMg2npg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iqpwkTaogejtT6ZbfvKVbUdOYD1YqmQeTsIhamN/2bYV6EtC0TWyz5d1Vtses6n3I
	 ZG3/faIPO/rEpC5I+i/BuXjI449eU6Ym4OKhCiwtx/hX54xCVZJ7li3XCZE0XIgMhe
	 dGTBXcuAzTZ1O2AZn8M6TkglGJDBSbLOdSZGU5cBZaz3o3s6LNZk3rlSRAklZQLVK2
	 DSikjrUsSdXZl6Dv2MJet18MT+FZO62t6+gpliHYX0fS3NKMPChGYdu4LXk4hWEn3x
	 reHUnjc+g0VRSN0GYKpDV85lV6PbEtsd3y2diMG/eX6g0B0ZSXKlSzaKW9rpEw7t06
	 gGReW7urfAptw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39977ab0562so8940691fa.1
        for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 05:58:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqz7CovNSio4XOvh5SRM/Y3KOFXsUdvDBaiNp+iuur5LuHVDJ7DVOQ/9H2jRLE15xF7URyarRJ509bT@vger.kernel.org
X-Gm-Message-State: AOJu0YzNjoB/2/7rMy9HnIhbfwh4ubO8M7vpm2ocHgaoma2paZDYjruz
	+bgZ6Sda1PO7cFijRO+428a251e1BIifwT/N0I+luCnlIQD25Ta/09dAOAaHSY61G6ipxZ1P84p
	e6ea+J4pKMwIFunEdWLed2XRAxe82W/c=
X-Received: by 2002:a05:6512:3f19:b0:5aa:6302:5718 with SMTP id
 2adb3069b0e04-5aea1f430e8mr2434186e87.13.1782478728736; Fri, 26 Jun 2026
 05:58:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782389357.git.geert@linux-m68k.org>
In-Reply-To: <cover.1782389357.git.geert@linux-m68k.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 26 Jun 2026 14:58:35 +0200
X-Gmail-Original-Message-ID: <CAD++jLnme9So3j77C9ELdon=4dmGEeBKYj80r2g9MoJXw5XApw@mail.gmail.com>
X-Gm-Features: AVVi8CdEmkCVzK9XzMqYnl1hXuqY8qAJJ0nZBuaUqgCHAKHeFp0Biu0iIjX6_Q0
Message-ID: <CAD++jLnme9So3j77C9ELdon=4dmGEeBKYj80r2g9MoJXw5XApw@mail.gmail.com>
Subject: Re: [PATCH 0/9] MIPS: TXX9: Legacy GPIO interfaces cleanup
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Bartosz Golaszewski <brgl@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 2:19=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:

> This patch series gets rid of legacy GPIO interface usage on the MIPS
> RBTX4927 development board, preceded and followed by some cleanups.
> No blinky LEDs were harmed during the production of this series.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Sashiko is asking you to fix the entire universe as usual, I couldn't
care less.

Yours,
Linus Walleij
