Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792514337;
	b=RPpgVl1bHojt/a1CmkgrgU6vxUigdZHycxiM94cxp2wEOYQ6o3h2p2KL5KTQNX5dBVXA
	 54ucf07aV2kjWsoZGVuqlI8DhWSCXDsDImJBXah3lWg/LbBfoPcbsmArHKMGMqzz5EUtM
	 R7oaYAUmIDDJZYEuNQP9Ylsc9hfuc/siuTSAayEzlFmKri5MtO2DJe7BW5Sc9UDsqS4J2
	 LC5wLGLCxDSGnLjDBg1IsfrnhMb8de8wDcWf4f1bEgdY4vEwzR+w0P7J4bMMZulao+HFZ
	 wAWPMYUYQEmjqN3TYwFmTCU4um1JIQXwEljpW/MItjV/WsedgSchBVmdFI9hPsQz+ug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5h6v8PMV52XAIibb0bLKm7PVGjK4muo/m4wCC4Oc5nw=;
	b=5bjOUWnA1J6WN/q14Xzq4yhVeaMZMjJznZBc9808T8HWwT/aNZPf3EhoGYKuh6YTtNHG
	 XNq2aKNMpS1IYbS9TQW/wAmFjPXPLPXpDQx6l4EdmH53zaeMEtzBQAFAxVc3bmZRe3oBv
	 5Gh0JmgajUiPKfp1vFEG1LF108EaNrsDXTygKh8hm9D4RtXj3loYothdSR1Caq1hC0DhD
	 VRGNByEMWl7L1Pagvu5SdOBtslCbGG9OaP6KDx3TxRSXm4e+ANa8y3rg4Gd7WgiyXcQaA
	 8KQQPRzMAMZ/mCypq/+WV/CTIrQvyngxei/nlm0ckae9uEaBurwQgrftfjZ1SMKMPww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=GwYGVURA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0493C60A2638
	for <linux-mips@vger.kernel.org>; Tue, 20 Oct 2026 16:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0493C60A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=GwYGVURA
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so1316138a12.3
        for <linux-mips@vger.kernel.org>; Tue, 20 Oct 2026 09:38:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792514336; cv=none;
        d=google.com; s=arc-20260327;
        b=Fcp+ZY8od9y1Dcopvf1eg5MK6jYoocd1bS26D/mIugWpcJhoogFaXggWoxZx+2YMMK
         7QLsN2kHGDocRp9VU0KNqY0hDUXBBfiRvQ2K0R0dhvTT6vFePD1CLLt9x8YGz1I+wK2c
         nrNUzo2mvUNmGhBtr4mEohdw/uS/pwB+yHId/8NYjTzrf5cRbuQgVZb39/PtWONIAhY3
         M/4bRqsw4LCyUXlxpMD4CJz3wDfjrpfH1vUCz4hYTMkPKCwbbRElh7HVy+BOB0hAHGCO
         nFra34tnUXTvHTYfhcwwDmxg3XEFBAU0jxRqUIveGv9fjazRmyloIbPgX0qps3AMj8+Q
         QVHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5h6v8PMV52XAIibb0bLKm7PVGjK4muo/m4wCC4Oc5nw=;
        fh=BntRnk75qA5PD9a10tTwB+gqSc+Ru4p482DLvyKMkx8=;
        b=AhoqYB0S/7XmsxTyKYlh8XHgcqgPeDqjATcG8jWhAly8AW0ezDduXXTlXTjRqpWSSc
         mIDbaUKruGxvDOTzh6jQIMxZGBJt2OlgqdxXcshw6EcJiHndtPLq0/LSqzlRK1YqG+qF
         02jBN6vNgTWCXEb1epa5OIOpwZCgMKBq84R6ncixx0fssBA0i4xJ7wiL1S+KUXFjnWKN
         Wx6Waw16ey/Aj8sTghWsxRgeOZC/w0a2eZypxzPFzNz3mZxDKSbMO2BGfUiN5IeuO2E5
         BYyLhtVPmOy3aC3kedHy2KVqDRymY1mQN/TGoVkk0ZpIC4okADFFU44LBzdtjqjhH3e3
         6a8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1792514336; x=1793119136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5h6v8PMV52XAIibb0bLKm7PVGjK4muo/m4wCC4Oc5nw=;
        b=GwYGVURAL7E3Gqp1mE6IbppA5fK/M6QVj3T4+Mu1VqNJAQWSHTCgIBs7lXAHx7VP4b
         X7Ol6JtjEVwHUVW/UUWijctAKk0S3FIF6sAkL2D0z4+yun1CiPIG05jQakKiuYArY+di
         qKUZ2JssWHS9PY4Rrbam2j+K8HSVipMYAjJhVwlz0qlw5vC30c9m2oPlM5nOac4bwKsb
         0iIOeo41vgbotndmbkqO3IW2nEL8EcaGXBwYuALkuaiWKHExqpmpd78k/kVF659++rVb
         16kcHMvBo17gh+L06xflahlYQXJ+NMSTGDwKIeHcy9Z1IKqewLhKEpxT50Ywi1EBHbtT
         Ya6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514336; x=1793119136;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5h6v8PMV52XAIibb0bLKm7PVGjK4muo/m4wCC4Oc5nw=;
        b=q0JTIjyTGGFJdV3pqPcivU60SK1ahN5C5MNGzjIt+l2fV3H6/KBabkc+oWvXdZLi3J
         zFhom34nz5g5bnDND14/t3v0QiGH7nkJozknZ2NwL9p4yjMfhYzuYHfKn+YXXdrbKnCS
         wesJqJljfv+7uHvym4mXIfaZsQ/iMZFr6RB9QJRSR3faC+1hJtZKCUiQWS/K90rAUDay
         3eh4dOy8P1skjcm+9WJ04yoY1vHZJy3ODOBKlqs2dbW5JMV+OthJGwlSK2yMt2oajALm
         WPMbzW7WCXYSTY+Ls6GnjRbomYVJB/kJ1fPfapXB1RdALMJLgV3sdpiMCZkh5UCntBL0
         jaWg==
X-Forwarded-Encrypted: i=1; AKwUvBy9A9uzqt+IW90Y7hOER0bJb0QEmaUaVHqqIacv9/MTSjKJ9mDCxBkO4gjzQu4Tb15usfAK+2cRPkpa@vger.kernel.org
X-Gm-Message-State: AFq9FYKd9SLfmliZDT5QHLzOhZdYEnAHIDnRCzn9/Vef4BOtA8jOyz73
	zgrJKmsYxyhCMO5mgQRvIbns++B8Yv1306GvOhK4QW9/+NaHwXdcilLSEW6asIsZrtrPS6pQApg
	DNWRi9l06NJW7E/MEAg7Ax2xYBfgmhjU4VJyPPX+J
X-Gm-Gg: AYBFou3uwG8aXWiQZPYXaivSlxTsePP4JB06X/j2MJKOCp9aVZEj+NGWaerPzV5AlOX
	6aOSfFXSVxJRIj7zhntl/gVjo/MgxZsi1hHHk2rNWs5VLfMokzyOnayvqq/jj45GnhjSQascq5f
	qJdqOygg2tu0d/BRKdV0eN56pZSGOPyW1tuV23Y4SXxuYu50nQFO3vLpmjrtiMxjXWGEXW/dGmX
	6lag27s3PC12PjIk7kWmIWfUzdQJ9nabVXp0iCuJocv8GNLpySikZ/sMtP88NtlgSclvQ+M84aV
	8KDVxiZrOOMrSDDqGvTATsUCFmC3LyGaAMPsxPwCI2x+4gA/+P/yBdLGC9AdDW188IuKX5enNF+
	2DKxQcAkHbWM=
X-Received: by 2002:a17:903:1111:b0:2e6:dcce:8227 with SMTP id
 d9443c01a7336-2e9a6c1a30dmr99034965ad.37.1792514336247; Tue, 20 Oct 2026
 09:38:56 -0700 (PDT)
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
In-Reply-To: <CAABTaaBL=TScs8Qqu3b8F6KZPGMyvwy6cBC3teDaBL6MGMucNg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 20 Oct 2026 12:38:41 -0400
X-Gm-Features: AclHuK9ZakV6IFm9eD67kaqUic0iU1MgVPLS7VN6RgjPgTRZmZP6_X_XOYOX9ZU
Message-ID: <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com>
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

On Tue, Oct 13, 2026 at 8:36=E2=80=AFAM Ricardo Robaina <rrobaina@redhat.co=
m> wrote:
> On Thu, Oct 1, 2026 at 6:06=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
> > On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina@redha=
t.com> wrote:

...

> > * As pointed out by Sashiko, when you were converting all of the
> > arches, it looks like you missed alpha.  I took a quick look and it
> > appears that it should be a pretty straightforward conversion like
> > most of the others.
>
> I've actually dropped the alpha patch as per Magnus's request [1].
>
> [1] https://lore.kernel.org/audit/CA+=3DFv5T4826T2sd0Gbh-nfZsqcWK_phdBKy4=
BLWOvDTt92t5Eg@mail.gmail.com/

The problem is that as things stand, this patchset breaks the build on
Alpha.  Perhaps this gets resolved during the current merge window,
but as you know we can't break the kernel build ...

https://lore.kernel.org/oe-kbuild-all/202610041836.6TatRQSm-lkp@intel.com

--=20
paul-moore.com
