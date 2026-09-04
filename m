Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6513B2D1D
	for <linux-mips@vger.kernel.org>; Fri,  4 Sep 2026 08:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511884; cv=pass; b=J5GhIsFEcFkd/Pi5qsASaf3l0bdOzoGNWcNaFgPfLSomSI3sW9pmisIAN7GlRb8Mu2DwEInsxavAuKxy3TKl3te62fHWCUjSAz3tR4OsE3lif8AZjtH6vw/e8o7CaG05EoU2rLE14glFYeV6HweVJXCbFCN8KtEeZTDsLl8nvoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511884; c=relaxed/simple;
	bh=el9C0eC2AOZtIteG0TNFb/RC0Pp+DPvBNH48NZ87dWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VlXCibOlLfJvy/A/O+olzbUZfpcW5KKROHzYZLlCsA1zLoBUYPDp0iKkCpv1z0enbI4LWk8cB1snxpBgrG0dKf1khSD6VSrGQpronrqL1Xpf37MD3B7qMq4pjbTAcRhUHeSJIXUI8b/Y1js8v7EUGHQDnLDxMtY+y5g5j59PY0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsDTFALD; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsDTFALD"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66d116f0de8so641361d50.0
        for <linux-mips@vger.kernel.org>; Fri, 04 Sep 2026 01:51:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788511882; cv=none;
        d=google.com; s=arc-20260327;
        b=lIbilbmEPrf+VChZ1/uylqmWZS4EO6dgQ7CTD9ec6VlwrbMwlwwnfI3AJJJI0xyCaN
         iibZHo63yThdv518xygBf+ah45I067TIW2D0kMapM3QbVFpVDBnvs2HxONv2OPOqxneX
         dr0Vjc/p7aA2OD2tgveAXqiqk2F1kCufA60aiW7hO+pJsdt7H60ndmlClMb850f1+qiF
         BwImjdY6lZgV6buPFK1bwR4Wst5bPf62aC9624RRJFui/Iga+wE46o9q+i3k249YShA9
         rQ/hOzwWqdba7UF3RhkUUWJ33+DMwd32HcAIofwi3dAuzvVS8mQfIe0bPIhnEkGaVGiH
         B/vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=el9C0eC2AOZtIteG0TNFb/RC0Pp+DPvBNH48NZ87dWM=;
        fh=TGIeSnJx3zLaV2wye918K7/SaEDAfkXPSIhuEVjGQqo=;
        b=Qg/uB4Mtcf1j+tOj9QcYGsX2D7UYC/V6ju0aVuG4zPOTZVp11PHjw2JJosVM++XeQ5
         onVlXC702nkKFdMIqx0iUeONR8YBVY2+M0gfCLwGmUQ0Bt5UQlMKx0JoiHDke5HcCSuT
         xD92yQjnpWH5L9C2fcyJ0EK721AYUEBp7Z6KE4z3w/ASKvYUzakROeiuCE3cFGZedH/r
         xTmmY72Nt7yTTl6Tzizvk58ur3Fwha9gGd09dsT/x3T5peRqzBwVzbA/k0utTWsjtPTg
         DeitJARRs6Vyp724qMaDY1lRyah6K9Rs/7yolNVIwHnJIk1wlE/UQG9Sy4md29Eoj93L
         ESOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788511882; x=1789116682; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=el9C0eC2AOZtIteG0TNFb/RC0Pp+DPvBNH48NZ87dWM=;
        b=TsDTFALDw4vsg1GN3g+UztVq9bUfuAKY8SIzq703SuedfYigVlMSf6jeA7JQqnvzo6
         H+bdIZiYYT2Id0IFRDBzF/pSegUpkX04c+5X/MDwrFyoNXITvDHTLSrW8BHC+m+KsTlh
         zyhiLtSj0nxFg/pCbyTDpM19NkKthyd2RAUgxwJ+4Bn8Q4cbn/9BlnxDwHjEWADhCtes
         V7MilISWIICAkfPebCopcNudegdQLPQg/C0wmTUwg9kYGcEuRq2m9nCL1uSYkLAMXp/N
         7hnYtLDQ/9EAXev+7dGUqNFxr0t81siXFKzxiiwpRat81kwxvqT1JpGLX/MXFOcCE7xL
         TSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511882; x=1789116682;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=el9C0eC2AOZtIteG0TNFb/RC0Pp+DPvBNH48NZ87dWM=;
        b=sfrClW/bshT/kn9arrsONviDDh28D4/SsXlN9kNpPOi9TwhPstMVNZKAdA/zcKsYzU
         KsRCYWf3eXWAHATvy+JgWpfBdO/vBFUEoLG9Fgt2sWOUHxi82pqNiA36D4lHL+006ttd
         XhPQKMla4qbGl+MDce6g37Bhm9WcBNc23+cpEPH1y9UWCwgsGC7rFp+VRcvy+AryGjIT
         j6m3Sg3U3NK2xxQcOteUvW1DnMcEOzVs35/aXQ1EZqLlEUXNx0zf/mJxc1T8fyQRqG98
         Fu0Jr2esqWadVz3ttlyuxG8BLxd+S37H+XA7aHOo5XZMDtmKWv12t3ZHIhcI25tBfWg/
         gi5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxcCpSg0RNdwQaw2SagE1thwFggUxV+mZvAW5tgpu79J6Flz+AuRCteXiuQokpEIp91f72cQ1nCSrbj@vger.kernel.org
X-Gm-Message-State: AFuF++k7xk0gQ6x1b0ZF5v1AhnSn46ymg8mE1+XFDoVV+BvGQvmrPzJr
	61+gG2FlLn36a5M7DFaSSuKkZ1jFDlC7lLSTOd42PiorB2vt/YQkNX6qKOwRyuNohPGNkXfQLGB
	PyfnHKO1JQGNK6AvEtf1BE9iasT2SJLg=
X-Gm-Gg: AYBFou0TnZAaUj8F5+tQvMrRu/B7WqVQSlRizw1kauNp8x3/TM1O2FRfAW1b7/5xzZc
	s7RMv4b1mTh7Fdc+jiUN3aJEHE9OruEr1OLW2mU6P30WIIenjYys/TwFW8dJ+sCG7/bh81OTLVJ
	ZzcuZmBXLPRci2wAZ66kN8SafjR7HWQlQLMHScwG1iZSIvWzOHLpvDxvkfMbdnSPLbxStNLXKbT
	Mh7HSC7+tqbdj2+hvUABtFs7iMb8sO1z+I3KHSRbR+x1nt8SLFdJTYYdL0ij+ie26S6DPY6LtYN
	Q7YKZEvGF+N8xqiDNFn56KkdQeABCrfAZJX2jCSVja7K38QzP+Z5llBMox2QkoLO6Ggx//+bhUT
	mxLtjPdtWpMnXjJ/w4cSl/g/h
X-Received: by 2002:a05:690e:e25:b0:66d:2c09:fb70 with SMTP id
 956f58d0204a3-66fb575c665mr1287497d50.0.1788511882074; Fri, 04 Sep 2026
 01:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904082954.48738-1-enelsonmoore@gmail.com>
In-Reply-To: <20260904082954.48738-1-enelsonmoore@gmail.com>
From: Tigran Aivazian <aivazian.tigran@gmail.com>
Date: Fri, 4 Sep 2026 09:51:10 +0100
X-Gm-Features: AcwNN1US813RpOVK53IyVszIyhGZqjM2-hVqjP58I9fP7PqngduJcqRbNBYYNbU
Message-ID: <CAK+_RL=RHfRLDc=Ldjx1p8KTHSKeELjnBpxEqYjwWX_8ur1hOw@mail.gmail.com>
Subject: Re: [PATCH] bfs: remove the filesystem
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Jan Kara <jack@suse.cz>, Jakub Kicinski <kuba@kernel.org>, 
	Namjae Jeon <linkinjeon@kernel.org>, Hisam Mehboob <hisamshar@gmail.com>, 
	=?UTF-8?Q?Martin_Kepplinger=2DNovakovi=C4=87?= <martink@posteo.de>, 
	Christian Brauner <brauner@kernel.org>, Amir Goldstein <amir73il@gmail.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Eric Biggers <ebiggers@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	David Howells <dhowells@redhat.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"Theodore Ts'o" <tytso@mit.edu>, Catalin Iacob <iacobcatalin@gmail.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, Andrew Lunn <andrew@lunn.ch>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Andrei Vagin <avagin@gmail.com>, 
	Wei Yang <richard.weiyang@gmail.com>, Bhavik Sachdev <b.sachdev1904@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Wang Yan <wangyan01@kylinos.cn>, 
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>, Malaya Kumar Rout <malayarout91@gmail.com>, 
	linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Luis de Bethencourt <luisbg@kernel.org>, 
	Salah Triki <salah.triki@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

Hi Ethan,

On Fri, 4 Sept 2026 at 09:30, Ethan Nelson-Moore <enelsonmoore@gmail.com> wrote:
>
> BFS (not to be confused with BeFS, the BeOS filesystem) is the
> filesystem UnixWare uses for its boot partition. It has extremely
> limited functionality, only supporting contiguous files and no
> subdirectories. Even though the bfs driver is very small and is
> unlikely to cause future maintenance problems, given that the only type
> of data stored on such a partition is likely to be kernels and
> bootloader settings, there is very little reason anyone would want to
> access it from Linux. Other old Unix filesystems (efs, freevxfs) have
> been removed recently, and bfs is highly unlikely to have any users, so
> remove it as well. Retain the UAPI header to be safe.
>

You are right that probably no one would want to use BFS for storing
the actual data today.
But some things have didactical value, rather than mere pragmatic
usage. It is the didactic
value of MINIX (and its limitations wrt making use of the wonderful
capabilities of i386) that
has originally triggered the creation of Linux. But back to BFS: it is
actually used in Steve Pate's
book "Linux Filesystems" (2024, unfinished yet), which is a sequel to
his excellent classic
"UNIX Filesystems" (2003), as an illustration of a particularly simple
filesystem implementation.

I remember when Linus accepted my patch with BFS on 28 October 1999
into 2.3.25 his comment
was: "this appears to be a particularly simple one".

Kind regards,
Tigran
