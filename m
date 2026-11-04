Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.210.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793752864;
	b=IeILdDR3rz8YDY7HisPyZwZ8ufbVltV8KPZClhT9lQifhQ45Tb932DNS0ouE9zNdZAga
	 RKU366Gp2vH9Wuqkol3Sci6GUTWkN1yByMoUfTP19aj6vkbem6qPPRhaL4IX6pCqekuLV
	 7D08wroYwFZXdlLQl0dgJ8F4EtdmxTuZ74lM6PZekBdPyEd4aSJUawim0cm36u5NPKHB9
	 KFzS9jgKJ5aowuoXIEjKt9t3Z6yjxALgSY5mzpXWQ70cEF+BVUCQ6FcwnSl2ys8QcqHM7
	 8PNAGjDteYZ3+QV34NTWic8fwOhiav/16Kxd7RA4C7AY5p9KMy0mTiqte5CUWbf+ffA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793752864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fPNnZyQIDXSKNoVkiNoUdoJZWsQu0g4dBkxCnrIJvKA=;
	b=Oh+3dsYlDz/DHy1e+4hJKhi0+DhhQ9y+fn6dxAvD5kXk69Gl5i+N0fHCOvlW09/rR6pe
	 SAMcz6jyuc6ZR72QLqK7cPEt95Yd7jl2FbXN/H8ZCH2tNbmEWLt3ORMeC+lJqpOKiLHAK
	 Yrc7jmEBP51tA4XQG7lqcTU+nUJMNe0Dji87qPP9VQjCnx6zm1UxymnEc4oRS7Odc4pi2
	 +ObkssZVrcs/+taVWe08i8aoX5HbByBHdebAcb5Ye2/szgrVHtMmBx8Cm3e9tB8EUtP7T
	 nn2MNxGEyDPSxKhd9gnAXtGodXJMlFnuywPdcI2ZBHGTsRZYOaFZ4gE7dUELK9cMCtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	arc=fail smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC675606A32C
	for <linux-mips@vger.kernel.org>; Wed,  4 Nov 2026 00:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC675606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a60f90a924so95654b3a.3
        for <linux-mips@vger.kernel.org>; Tue, 03 Nov 2026 16:41:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793752863; cv=none;
        d=google.com; s=arc-20260327;
        b=XnQfMZD1DIdfp/T+R+/wWGMsWcQJesBetSFKwJaY9YEQLYIemMz7lHkbK+oLHV+pS9
         Yxm2vglSzvrREhFGqG5A3vPbgdagjABEtp4hbORPKX1eq+qdluhZtEGNqIRB2NcMILwZ
         yjUR2Y/R9HV0TLyJyagk4dcru0MUwoDZ/kWMrWJEnK65W7RSCXfxExasj0Sn0otvVtZ4
         O5NaCI1TSBXTjVvIag2itN3dzHP/9ZauZ6SX8A/Bvpy2jQ80gFknQx73sIWqwxu6D9Yb
         PE55oymbEJeIdZqHnPbl/4ofGmaUKtgkUPrqwdreBiNJDeWEn0IGjZfxfk2U6pVHbk0C
         +Bbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fPNnZyQIDXSKNoVkiNoUdoJZWsQu0g4dBkxCnrIJvKA=;
        fh=pwpwXZ87T8e3cPMd5Umv/dCmlpse5aMxCv4/UjhR0oc=;
        b=K/koS3gHYBLEE549kALXha2SzQwt3szMgx+WeJGCzSpWeGBIZ1SdVW2sAmLDyQlDw4
         IkOTrjsdbTXvaBx/zBf9aKlZc/Cal5H0DX5qs0yjO+chh3NzHOjYK7QDuKqKHA7/wl3p
         UIKBmdXnDcwUp7pNclIbxGrYHdtmUtKgsIv34LYxEs2GaT1HBUUnXU6cNpLPkL8+qlmg
         5Rcim6eF9W5CluY106D8bgeCd/Y1eX5tUQVhjbaaiYOYNiLFm0kzkrDUmOaSKoMpHLTz
         FbepSAL33k9zgz4eNKKhNxzGI3lNHREv9O6F7khj53V8vXx6RUKtfDbVu8sbaAifo5cL
         TjPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1793752863; x=1794357663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fPNnZyQIDXSKNoVkiNoUdoJZWsQu0g4dBkxCnrIJvKA=;
        b=PTPniKxw8lSLWSxMbmhmXVodXffwfFqC3M3cDEPYPvY1SsBjNOjXXv95CLFg3rVQFu
         x1tdyRAr0bqYQ6HVqsjHpfPPU10/1FhE3kd/CHXKlKRa2s8Jf9/RWGaRvSd9s3tWp3+h
         Tji6Btj/3XlTUrwGPe+aphN7moDM3Ujmyews2MtwEsOdhWo9d1B27IQnIAXxeCj/AgoF
         TwCZd9YYNW98ENSoBC4GvFAhash4XN0WeHulLfX/snYculqtKEVgWcaAWPf68LjYBfvq
         i5NzGzwAog4kKLckyYK3n2IY4tOHLEWiT5cJSG6dbW9SW1FZ4MjXmEMstZ0yw7BaSVW5
         5qpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793752863; x=1794357663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPNnZyQIDXSKNoVkiNoUdoJZWsQu0g4dBkxCnrIJvKA=;
        b=X8LaCbp+M0e1mHWsj8QraGnCXuNczMsOtcucPSC99fga+Sjr5lyY/xrQkC9TLWdADa
         lvpiozVVKFBPWOHKZE9vgqZTmVzjD+UQcjRGmbPZ6qAXb9Rmg1Yr/NAr/6IRrwL0ejtm
         S6OayTkR7CBHbwLMORRvrfTCLUFCATXU4KubqETKvI1xL5k9qAwUxAi0L8yGvfY939CW
         Isc+B+CMcMXa83eL0V+Hz2IHJW2wH1fs2SnEojIph+ahKJ3UVHlGc8i0f3HPv9b76dN6
         2mX6xM5gxGaVIt3bTWuEBToX8HrneAXrR2G4+KBAcNvKxUCWagcr+s8ugwj/uwsvDwGF
         G7Xg==
X-Forwarded-Encrypted: i=1; AKwUvBwblIca2pbaUdB26vWhWDcZgzGDRhqT58LruQC3/AHsHuzwUHY7KkEjFrXHcKd2WD/A0h7szQCX2DlJ@vger.kernel.org
X-Gm-Message-State: APuU4Z8Jg2SWL+gH+0RBOKtEpS/RfB6Gf1uAmMIEZL641/SXScBsEkoF
	Jzj0HhvVcm+Wq0C3LAQq14MMSALwMJ/wk4SIFUkaXjlKfXojKh40xkO8DuEWOlwKSRaDgDmZb7W
	W6q6VkQCWi2j24IBAF6LMeYqWr3PTDboaIukPf+jg0hOGf/sj0kG5Cw==
X-Gm-Gg: AYBFou1ZdKFFKBb+EJPnAhJ+/YZkNCYxzHX+Aj+7iuiUFa6/QDv3gwhnHUYU4NOV+j5
	X3hY/Qb/5C27RQIyDecIMOsOi0kst/+VSDekI9vGwszmNpHLs9lyw/Kpssn4BCnGDfGprJAgmKt
	AyDSSvQpPihEb+QJ+pF4tiimGl8fRIZ269mKcbE8uLfPGs5uiukjsUppJHtciYZiMdf+VTyelv8
	ZwpWh10rgyIL6w2ud0IAxRZKUp1lmryjUPWRrib/ENVecawA+0bOF/xwLrXsqH2/dNHx+cpmQIX
	r1E/vgroBc/xWQj7eqMzzESMAT4d9AYGvWix2Kaned8SHx/oir0MBAhxX41AbrkVMucfjR/murW
	jpm4GhqKQiMu1lft3hAMcUKc4okG+pe0tDFvGGhVS0gnSnXkpK2WM0SO5aiMgzKPvlK9e
X-Received: by 2002:a05:6a00:2d96:b0:88d:4b30:1c11 with SMTP id
 d2e1a72fcca58-8a9ba703bc9mr11394030b3a.6.1793752863107; Tue, 03 Nov 2026
 16:41:03 -0800 (PST)
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
 <CAABTaaBL=TScs8Qqu3b8F6KZPGMyvwy6cBC3teDaBL6MGMucNg@mail.gmail.com>
 <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com> <CAABTaaBOrPknzdxc5S6L9hGu7hbFu2e1RZG=Sxjb_B1Cs4Sixw@mail.gmail.com>
In-Reply-To: <CAABTaaBOrPknzdxc5S6L9hGu7hbFu2e1RZG=Sxjb_B1Cs4Sixw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 3 Nov 2026 19:40:51 -0500
X-Gm-Features: AclHuK_mzIhdjHPxjnkTYRthyfMgrzjS55JZuNf6mZPYYsQQvO81kKGlvJUv8_0
Message-ID: <CAHC9VhQ4U-Z2KkGurfMihJgzGgwD3miWSW4wWAjWvUdDxLpH7Q@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] audit: log all six syscall arguments in the
 SYSCALL record
To: Ricardo Robaina <rrobaina@redhat.com>
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

On Fri, Oct 23, 2026 at 8:45=E2=80=AFAM Ricardo Robaina <rrobaina@redhat.co=
m> wrote:
> On Tue, Oct 20, 2026 at 1:39=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> > On Tue, Oct 13, 2026 at 8:36=E2=80=AFAM Ricardo Robaina <rrobaina@redha=
t.com> wrote:
> > > On Thu, Oct 1, 2026 at 6:06=E2=80=AFPM Paul Moore <paul@paul-moore.co=
m> wrote:
> > > > On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina@r=
edhat.com> wrote:
> >
> > ...
> >
> > > > * As pointed out by Sashiko, when you were converting all of the
> > > > arches, it looks like you missed alpha.  I took a quick look and it
> > > > appears that it should be a pretty straightforward conversion like
> > > > most of the others.
> > >
> > > I've actually dropped the alpha patch as per Magnus's request [1].
> > >
> > > [1] https://lore.kernel.org/audit/CA+=3DFv5T4826T2sd0Gbh-nfZsqcWK_phd=
BKy4BLWOvDTt92t5Eg@mail.gmail.com/
> >
> > The problem is that as things stand, this patchset breaks the build on
> > Alpha.  Perhaps this gets resolved during the current merge window,
> > but as you know we can't break the kernel build ...
> >
> > https://lore.kernel.org/oe-kbuild-all/202610041836.6TatRQSm-lkp@intel.c=
om
>
> Of course, you're absolutely right that we can't break the build. I
> was afraid that this dependency might cause trouble.
>
> I noticed Magnus posted a pull request a few days ago containing the
> "alpha: enable GENERIC_ENTRY" series [1]. It seems this will get
> resolved during the current merge window.

... and it has, or at least it appears to me to be resolved.  I
rebased the audit/dev-staging branch against v7.4-rc1 and Alpha does
indeed appear to be using the generic syscall entry/exit code in v7.4.
I think we should be all set here wrt Alpha, thanks.

> For future reference, what's the best way to handle dependencies on
> other subsystem changes like this?

Generally speaking communication and coordination :)  Talk with the
subsystem devs/maintainers to understand what they are doing, let them
know what you want to do, and find the best way to order things so
that it all lands in Linus' tree without making a mess.  In this
particular case, with the syscall arg audit patchset not being ready
(missing maintainer ACKs) and the Alpha changes going into v7.4 it
turns out to be quite easy, which is an important lesson: sometimes it
is better to defer a new feature for a release just to ease the
coordination burden, enable better testing, etc.

--=20
paul-moore.com
