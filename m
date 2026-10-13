Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78044EDCDB
	for <linux-mips@vger.kernel.org>; Tue, 13 Oct 2026 12:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894965; cv=pass; b=dWTOlHH7oNbE4AP+0IQx78HOtiVuhLSCNaf+vjJz/F13TQReGTeYR7OHNdgRx0wBDDiPkSXwsW4xwJbMv/AncdphSHRFbwJvs9rgI0L3wMrjN7ElHTzVJOVaSj/Q71qpsyGqSwVr1BU39dFovFr4o9jVyBxjj425MeNCQjQ08RU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894965; c=relaxed/simple;
	bh=KJz0ljhpxQV0dxuLmyAZzCH6KN1a+1DHS+L2+lDvs9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t/LrdKWcmYgwxxMg7VnLubfe4Uyjte0jM3xy5q8xWd6qLTQyMwJ8ruitBe/K41FZ45MEbA5Ht/P4OMJaRV/RbqLjx36vrhlfOs+ZKA5iht8PalNfhdm1KjW/Yv+EMp/AXqj++C+FyqwqeHGG/YkLGAN0vHf4WsFof4hq/IMrtyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HEzqavGD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YgoLMzzU; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HEzqavGD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YgoLMzzU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791894963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ooKLa1R3KGvywNv1R+3CFpG+InkWtGBVvbQRUtpRSf4=;
	b=HEzqavGDVm27rpHXWPwhy/SncpPuXeG2heUDAh+82wPoVFN4EOHMPspodITW890lZv9RK/
	bK359dt+dUCsO7TQkf/IYO16RpEOb7bTivPq9DaXBrStYQcQHFNM8//ryCg2d9HsL43XTm
	iIHcvaV66rA15qIKn8AwEHHqY55PlJU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-UIu1adGcNGi4_nBUKAcILg-1; Tue, 13 Oct 2026 12:36:01 +0000
X-MC-Unique: UIu1adGcNGi4_nBUKAcILg-1
X-Mimecast-MFC-AGG-ID: UIu1adGcNGi4_nBUKAcILg_1791894961
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c3613c35145so166881566b.3
        for <linux-mips@vger.kernel.org>; Tue, 13 Oct 2026 05:36:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791894960; cv=none;
        d=google.com; s=arc-20260327;
        b=iCfLx+7NmBDGRLpyQUAqSAlviOQM6V8cy1L0jeagAizTkbyOzDC373mO7ASISV2vJZ
         1xq14kLvOCYnmE1QHpT/CBWAshZn9HsgZKQ1/bJQ0BS9lWCjHh65/gmpEg13fJfJwXbp
         65bJd1AZB5elD/pgciW3AQKCsu2eYg+aJ3e6AAbc6c50PyFtOWHj14qEiQUL7/dM/vou
         VbhKI0POxhB913DiFD5wjEfiMjTGU21UW17u/Cd6vk0gNwlBva+6g6QooFsjariB8dTB
         layyFk3jG4/MvRJ70zxKHKxmy8a+Qd4oUCfbW8JMC5fZJ+Ap9Bc6imrIV4cLfYX+k+oh
         ZSww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ooKLa1R3KGvywNv1R+3CFpG+InkWtGBVvbQRUtpRSf4=;
        fh=CQHedtHr2H59QxRZahrwV81jUJL4fV1BARr1swYp1As=;
        b=k8KNcsgCalWcMFUxNf1FuvC6SexSC5C5c97FXAioPs4vTX1Ut9OHwDDvVgrezrTiuJ
         PclwolRsUUNOXj+Xgl/D1i3sQ2hCNNNlNfVWRGFtrdXDU6LXDWZX/cgcXlgyH1XqW93q
         fzSxTv4cFxTWnWxxAm2HGDOYmH6yrWwvvcB+Xnv7r/rhe0tl1luMpf9ilAXlXk9fbi5U
         aSviZglaoqWDm34Bj9WKypB2A2uFiddp1+ky+XY7TdoyotAd9102VxtCd7bTWELpnJb1
         rwsN4A18kdviicXkitnCraCel3aYf1tHaJedH0zIauP0ENQun85UulRNW97M9AoCU7wR
         bFmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791894960; x=1792499760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ooKLa1R3KGvywNv1R+3CFpG+InkWtGBVvbQRUtpRSf4=;
        b=YgoLMzzUztWzAtGp2BsnHbg4p+kiT33FbX6LqK9gQMrWA1L2iCBRfHGuRar0q6PPvi
         Z+/pKSPqH9ljzJkup8+HBSxiFoZhhYF+EG9czbqjtvxPdNGONXNP8VzJrWWyK8wt1XJI
         WJmkye6UFTuSDnGTG+lWNQekyg9JvV578yJFbnZ+CB30MZKnFvJ/g2FG55n0ZYrYQOeT
         JopL6l+aVJkFYLJz1V3QLGr7MSW03SSWSdAIoUOmHauJXBNbtpwoVRzcLPZouXiBgWiG
         hACkPXzW6b5ieD1bEV21hIW1mcG/rZHsSqaWAw7jG0dKXVWwMufD+Bh/ffF5JBE9k6bi
         o6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894960; x=1792499760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ooKLa1R3KGvywNv1R+3CFpG+InkWtGBVvbQRUtpRSf4=;
        b=nfWi1a2QRiKFs323Nghu5e7Oz4OGHCIOITHBYy2jGQ6fC2rgSQug1kUqDrqPCv13hp
         Lhp0208Kda4MP9tXliSltkzZcJFQNVQYtbOnb99nqJf3a68X/34q5ZF9BQYHHk2L4fDm
         ZWL6JrRx+bkY7OQbgYkTtHXaApkXA6k6FpEFlHOjnxJeYjhBdcR4VxslSmEZWAnX+gX0
         ipBW33EWsZlrSQ43OssSZpnI7A2h8UWWLLPF1Po/dpv6qgnST9VgQXneY9aZ0N+1iNpk
         PRJjAQD9yTg4qdZkAGWDYttuBQ3q4g8pgY1lXPWReSIneDT7bHYrp98bUPFG2RxXlf6o
         k/9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwyLdfu1/nXPg89j/EzhCDtXEZx6Sf+ivsWNS4FgmRQTN5fy8PdEHf3ZpX489WLmA/q1K1UwSHX1w0Y@vger.kernel.org
X-Gm-Message-State: AFq9FYKHFw76b1yKJIozS9O363pxPznzsLvWswVqoLQXd1PlF/7JKBmp
	+FPnlLVaf9o/MDYokpsH8YqdCTfHXC9bXMQlKee83HJpNyMZzl7MZ8kpF2Ae1WeQKdbROrkR+2f
	dC4y3aSrzV9GHYyOAgCszmF+HDdXZlI2Tfxk5Xi3LNLokcTnMcARenTEcfm1vg1Lrn2nLK9VkkE
	+Sjq6gfFj+CYbl9K6w1NAdesCiAa+Y0fdxy8raWw==
X-Gm-Gg: AYBFou3fufmBRPDHS9lbDPKsyE12Zr2AmJqsu6mLH1OKeqJMxXTt4Z32Uq5Zl9ou+i+
	Nh9iud+Q0AAN6jPduD2sqXRzrK9Vox3+M4FVBHVVcej58S/nelEInuiPTJ7QgD/3fnZymC2Y0OV
	eH9h7f8zaH4tQyPVfRSMunAeDrP7Im5CHRajmxiwAbqCpSCGJUT2g99pQEmcaaxFeByA8MAYhjt
	yMFF5PoTBd/GUsNk2Qys+zlNvSS4ZekZJnrDAsuxSX3IMkOq6841YnRNqlje4NDyjkm8kCvnYwc
	O/I=
X-Received: by 2002:a17:907:7b8a:b0:c2e:1b4d:e9e9 with SMTP id a640c23a62f3a-c31a9f6ade4mr1135545666b.30.1791894960280;
        Tue, 13 Oct 2026 05:36:00 -0700 (PDT)
X-Received: by 2002:a17:907:7b8a:b0:c2e:1b4d:e9e9 with SMTP id
 a640c23a62f3a-c31a9f6ade4mr1135542366b.30.1791894959880; Tue, 13 Oct 2026
 05:35:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790088067.git.rrobaina@redhat.com> <CAHC9VhQ=FFYVNmQdiMsqg+5KDDrSC3SZS+H2=r_GkhfwQox8tg@mail.gmail.com>
In-Reply-To: <CAHC9VhQ=FFYVNmQdiMsqg+5KDDrSC3SZS+H2=r_GkhfwQox8tg@mail.gmail.com>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Tue, 13 Oct 2026 09:35:48 -0300
X-Gm-Features: AclHuK-0QABZ6yrPwALI3VDGc1f2HfQWIB06SZ96BvTfEuUJkskwg4GU5NbIk1c
Message-ID: <CAABTaaBL=TScs8Qqu3b8F6KZPGMyvwy6cBC3teDaBL6MGMucNg@mail.gmail.com>
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

On Thu, Oct 1, 2026 at 6:06=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
>
> On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina@redhat.=
com> wrote:
> >
> > The SYSCALL record currently logs only four of the six syscall
> > arguments (a0-a3), silently discarding the remaining two. This
> > leads to the need for auxiliary records when audit-relevant
> > data lands in the 5th or 6th argument of a syscall.
> >
> > This series extends the SYSCALL record to log all six arguments,
> > by adding arguments a4 and a5 inline within the existing record.
>
> Thanks Ricardo, this looks great!

Thanks, Paul!

>
> There are a few things in some of the individual patches which I reply
> to in a minute, but there are a couple of "global" things that I
> wanted to mention:
>
> * As pointed out by Sashiko, when you were converting all of the
> arches, it looks like you missed alpha.  I took a quick look and it
> appears that it should be a pretty straightforward conversion like
> most of the others.

I've actually dropped the alpha patch as per Magnus's request [1].

[1] https://lore.kernel.org/audit/CA+=3DFv5T4826T2sd0Gbh-nfZsqcWK_phdBKy4BL=
WOvDTt92t5Eg@mail.gmail.com/

>
> * We need to get ACKs from all the various arch maintainers.  Aside
> from the parisc changes all of your arch specific patches are trivial
> (and cleaner than the existing code IMO) so I don't expect anyone to
> complain, but getting ACKs will likely take some time.  Even the
> parisc patches aren't that bad, and arguably they fix a problem for
> seccomp so that should make asking for ACKs easier :)
>
> Since I expect chasing down all the various maintainers for ACKs will
> take a little while, and I'd like to start getting this patchset some
> basic testing, I'm going to merge it into dev-staging now.  While the
> dev-staging branch doesn't feed into linux-next (this isn't likely to
> land in the next merge window) it is one of the branches that gets
> tested automatically and included in my kernel-secnext RPM builds.
> This also means you won't need to worry about keeping this patchset
> up-to-date with rebasing, as I rebase dev-staging as needed (it
> intentionally isn't a stable branch).  Going forward, if there are any
> minor changes to this patchset, e.g. a few line change in one of two
> patches, please just send a fixup patchset based against
> audit/dev-staging and I'll squash it into the relevant patch in the
> series.  However, in the unlikely event that a major rewrite is
> needed, just send a new patchset ... but I'll be very surprised if
> that happens here :)

Sounds good!

>
> --
> paul-moore.com
>

-Ricardo

