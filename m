Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792759536;
	b=VQzMe3BgLZXhUfJHXmfUJAmIwJIYmrhqKyvpxuVXQC31csETVEsgVIljDZNiWX95W/sx
	 MmgLLGcIrEBXZsJ901DEWUvFyNp8nc8ZP4erWJA4CvDr4P4qdHed8/fNdRjcu1ywI+Vm5
	 JYsNQOcUsa3GvjuzX4Aqoz0OlBNiH5ZCo9g38rZglXpi9jxoXDozuckOje6pzYyYuNTU3
	 7ke4d4uS8E1xUVVYmxo2zqLvC2MVrVk5AYtx48kHSLqWj5JPHB0UPC9/DolSBXhvrrjU8
	 YkPD+nGINye7AUwiDmKQ1yI6Oj+4B5+e5UwZM2Mk1pAIpNgWS9S/FHKfWvHPiSkazTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792759536;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
	b=jeOk5d4Sexf1UwHr0s6F86hBhWIn8WG6JdUdS30S+doqp4VxP/jKS+BbJIv+Ai5Kx4oL
	 CTpUKa8S5J0SVWxHjnupJDac+Bf5bv6Zm9a80u4HLEO1HDfN8/Q2XDTDGhhQPDANiObeH
	 0Po+Z/qyNdbU6EzgbUiWmP/JInG8LhzLtjXFMzfNK2YNk/nqFczDBohgkFTSL82w2jCgZ
	 KdHi5FEFm7yYLXig+xjC4ndI9zmjLOPuV5mI5PHCIfnll8zuAYWHCU0oRnbUSTwGt2gCr
	 lXLafcj2XstH2jHqRXitMmHx+rl24xfMZ0tujhM+dxeVEsLC5NRRvaPYR4B2juX2U+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JFCilMtk;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kvNnk1JJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BAE606A320
	for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 12:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98BAE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JFCilMtk;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kvNnk1JJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792759534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
	b=JFCilMtkUblpG0se/OsDP8XQNcS0g5CbxN4al/yDpGmYxsKAuaBflAG9Ot1vUdjN4LK9kx
	6KihEPKO+lHEjYmLhUHLQBXjHW8sH5zxS6puIxjSFzPEXhebnff8clkn5/qJZVNpLCKzd4
	ANALi0his2JyaJHN1lr2Y9JnHEvtemw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-PnbWfM9iPdmlv2bxbDQqng-1; Fri, 23 Oct 2026 08:45:33 -0400
X-MC-Unique: PnbWfM9iPdmlv2bxbDQqng-1
X-Mimecast-MFC-AGG-ID: PnbWfM9iPdmlv2bxbDQqng_1792759532
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c40285df2a0so47869466b.2
        for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 05:45:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792759532; cv=none;
        d=google.com; s=arc-20260327;
        b=Dramp8aLdNRlRoLnUoOJ3ho93CB9RfpvRzQTx5rXE45QWaQyeZUY1kWClrQwvh2yV2
         SnlPVHx0VIRTFZYEV7LQ13A3mZKSBJYF7YsMgRisN9QGm4AHQvnfRbytrJ2EXVBd6nDd
         T5aFg3oXv51E+LpwjGVRgUjfIM1AwhAIhGg77InHcq7WtwLKogIpeW1RItunt4viuhCR
         peigdR3Xy+3J+J+qServnK7vKWKUiQ7rs3WA5MK91w5sanj7z11kR+78dMkHukFTzJyR
         Zfjtuty0PWSo5iGsafgUVIDJkkW6830iFR3oUekpqecADdesJTdTFCNOgko2hIdG0+A0
         9mzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
        fh=ApVq9u6z5tSovYDAWM0N5yMtNdVNpfDHCyJQJDwgU2w=;
        b=PJ/cS6uIoNnkNPaIvlslgKJYPN1hkv+sV6vyNkztmZOsixSfRwi2PrQyRFKDnKGc9j
         T0QSFql7kLZLoxxOuLWsVV8lPfIh0HUA2JDTvoVqeTzUo2/+Dr4F91c3pEGeaBDTGn6H
         e7RKBXJCuENBMSSS/p+x9+lizNsACFdXckWI9u00MmQIXPzme85BH2K+eC0A4gUov0P/
         I36jLflq5QhTKP3bnUz8tYT0ScM/68jHxuIXJnrvxuDmrugibbqcpMIa4QLcDQqrcK9K
         k307ocQANP+3sevUhhViRfGLAKXVQnofk7i7iyxmTOoDxRaS/oAuDqRN0YJLMNRX/g8Q
         SHYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792759532; x=1793364332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
        b=kvNnk1JJq5fdRFGdNebQGgC7q5Z0qxP3L9LUL3H41Yth6fk3qBq/vZiBoiFYGjpoaa
         n0dKED8PrTcleCQwOwv7EZPUJSb5pjlDuNEjMabYepgzXz7C3LDzgy4bYbztjIZyxLVm
         9Xqzkh+s/Df+49IhCw6cb1qC+ZGFZ4Nq2c4DcUiiFr5dQqfAvw2NN8GjnWhsaGKkKTYY
         KzF7Id+sGWe/yi/p3xtqj3XYUidB030oWuXhAmSpJVfUlD5svLFMDnkRZ4hFBW84cWXH
         J5am/hwQZPE6DkBBvdYxtO+xDbckJ1JouoT4CQ4/tz5aQZvy3bGe6vJgFqQzFd7jFxWj
         dG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792759532; x=1793364332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
        b=JFWEh039ZJ9mcIRaSnCbh0k9mMG8cAEEorTdo0NuXRQdlYpRCAnf6AaVby6GOnzXrP
         lKuwJTkDMlMYoU7WyqKPyozheY0d+v1BL2F5wWETMUDkza2+cZ/uuclnUnmuhPlPo4kv
         HOESDvJi6XCti9RLpbJM+m7BYxg8ely+0pwMF165P9dWQdexJV10DChwjU7gv5K69Rp6
         PO/SJs66/jPzJWTyu4kXlLsNyU2mgU2GY5m2JmgJqhGe+QvufyJUWrVkjsZb1fpS/2BH
         3aJ7F1v1rCUihHEV0hquWi2JWqT8EgeWuckbIO9TrH+eZNYgeAytGbFEuoZyw/XFjAHY
         iLXQ==
X-Forwarded-Encrypted: i=1; AKwUvByc9dAndpAnB0EltmQENNioxIp1NZez2HTbDJGcDmEX74Gl26bqD3i0ox1hKlkNUgM3Dn0Uc2xFhury@vger.kernel.org
X-Gm-Message-State: AFq9FYKFQvjprvCVzFYUCaTIRYgz0i6wmoZ9wvrajSh9NCNw5kZ4L4RG
	fG/YZ3CwTL5QkUMPxwLicr1FNBWc0yzMh2DNZurzAw9XNNU+190RuD5uYcFOTJs45Za+SdFpsQ9
	ppv2W+ALKaRxqUnFcdVljsGm4Yk2vP41KI0JZKHleWdiWckjizcf8y3756hZgNrgkkuXFY1GbhQ
	tdVsK883XhDoN35hScJ5lJ9bgERR1iYI78vc7qVg==
X-Gm-Gg: AYBFou15TeUlP/2jvrAPwpzeJMTg87c3pVU7BwpBe8ohJx+ofDZf7Q7YjApCBlIVhPW
	t9Smee3S9og2kRg470k+vlmb8nRu4fvvZMiNI2P8E0wzGggmghDuEd1rHYHdE9T4Te1P5vnWs+Y
	ryQEc66J8ZnPJ/HJchBjeOBtE5kS92IVHYXONos2cibnu0hurS6BMgvv7mapUMC+EUAqWpldnjz
	i0ZEnCqrrEulsfFEtc41G+mSS8ncFwB0HTeXpZ6pwtU6uASc+SeMWh8Zlc4k+z3FGsHE6M+CVw5
	r0A=
X-Received: by 2002:a17:907:fd8a:b0:c2e:46d0:b802 with SMTP id a640c23a62f3a-c46a92ae6c0mr328358066b.40.1792759531918;
        Fri, 23 Oct 2026 05:45:31 -0700 (PDT)
X-Received: by 2002:a17:907:fd8a:b0:c2e:46d0:b802 with SMTP id
 a640c23a62f3a-c46a92ae6c0mr328354266b.40.1792759531460; Fri, 23 Oct 2026
 05:45:31 -0700 (PDT)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1790088067.git.rrobaina@redhat.com> <CAHC9VhQ=FFYVNmQdiMsqg+5KDDrSC3SZS+H2=r_GkhfwQox8tg@mail.gmail.com>
 <CAABTaaBL=TScs8Qqu3b8F6KZPGMyvwy6cBC3teDaBL6MGMucNg@mail.gmail.com> <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com>
In-Reply-To: <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Fri, 23 Oct 2026 09:45:20 -0300
X-Gm-Features: AclHuK-AKUESe6iHVc-VzwOYib6sgRKlK0BCnAtM6wg5S60Ozyo0oOLLHvDr8CI
Message-ID: <CAABTaaBOrPknzdxc5S6L9hGu7hbFu2e1RZG=Sxjb_B1Cs4Sixw@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] audit: log all six syscall arguments in the
 SYSCALL record
To: Paul Moore <paul@paul-moore.com>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, bpf@vger.kernel.org, eparis@redhat.com, 
	sgrubb@redhat.com, oleg@redhat.com, richard.henderson@linaro.org, 
	mattst88@gmail.com, linmag7@gmail.com, linux@armlinux.org.uk, 
	catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, monstr@monstr.eu, 
	tsbogend@alpha.franken.de, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, chris@zankel.net, 
	jcmvbkbc@gmail.com, tglx@kernel.org, peterz@infradead.org, luto@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 1:39=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> On Tue, Oct 13, 2026 at 8:36=E2=80=AFAM Ricardo Robaina <rrobaina@redhat.=
com> wrote:
> > On Thu, Oct 1, 2026 at 6:06=E2=80=AFPM Paul Moore <paul@paul-moore.com>=
 wrote:
> > > On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina@red=
hat.com> wrote:
>
> ...
>
> > > * As pointed out by Sashiko, when you were converting all of the
> > > arches, it looks like you missed alpha.  I took a quick look and it
> > > appears that it should be a pretty straightforward conversion like
> > > most of the others.
> >
> > I've actually dropped the alpha patch as per Magnus's request [1].
> >
> > [1] https://lore.kernel.org/audit/CA+=3DFv5T4826T2sd0Gbh-nfZsqcWK_phdBK=
y4BLWOvDTt92t5Eg@mail.gmail.com/
>
> The problem is that as things stand, this patchset breaks the build on
> Alpha.  Perhaps this gets resolved during the current merge window,
> but as you know we can't break the kernel build ...
>
> https://lore.kernel.org/oe-kbuild-all/202610041836.6TatRQSm-lkp@intel.com

Of course, you're absolutely right that we can't break the build. I
was afraid that this dependency might cause trouble.

I noticed Magnus posted a pull request a few days ago containing the
"alpha: enable GENERIC_ENTRY" series [1]. It seems this will get
resolved during the current merge window.

For future reference, what's the best way to handle dependencies on
other subsystem changes like this?

[1] https://lore.kernel.org/linux-alpha/ataJlL6L7TrS3gWs@z440.darklands.se/

>
> --
> paul-moore.com
>

-Ricardo

