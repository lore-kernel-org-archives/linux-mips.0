Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795652052;
	b=n9vm6kssd11RHdDxGf3JQso+tcSIoKJ9rnezfw0Ig98T7Z+RDicOZuILRES0ONTQnlK6
	 RSKveqk6fdoQrdHKriD83k6MTk/x22YN5x1N23KG6cjWa0uvM3hlvcLZll+yxuVSj4c++
	 S4bm2MMWW6GydzKl1IetvIi4fw2Qs765DAshz4sswhcyg//tyAurja+f13eOiLd6q/Nmm
	 7HYQEP3SNpNFiqov+JGdRpkfyS4NAFYVbrNXWpQ1utgInBER5334XYKo/clDgw6Gf0tWu
	 jbbwPIN5MOYNi2TGjUV85pb3JMnywduzJ2TG1iYwHltNPuBs3i6Kiiq0CZe97IG5oog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795652052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZyKI2qUNxqXt+wcWqV0BvUgrOWmkIinXejzZ4Is8tdg=;
	b=IAXkFKt2qvFhDn61r7IBHw2tIyiLGD9agr++o4Po/D2Nq30Xaj8o/fTSxt+gcXq5YuSw
	 DNBjvEiBbBS85bzN4/8GHtR3RmLM/TBXfb60rgTquU/IT4bLooPHivqHFzM8wd+Z9gdd9
	 fSpilQj0gDfr0y57+W3tSv1jN9adSpfaSj//msvGEBXNVqQ8p+OhuxiOlG98bNIQMGOxN
	 eX/Q2gGq6528T99i7hM9EttkIRSWWLzZa2Kd4kFVOVx2hVC8pT+70Dk2DZNOVXzjidBSN
	 SIKNKLHk5IcPTNEuB037JQt7xgvXZA6kbJMIQA9OVEQGtHvZALkzzwwRf92dgp5T9Og==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dhvbt+N6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3079E606A323
	for <linux-mips@vger.kernel.org>; Thu, 26 Nov 2026 00:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3079E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dhvbt+N6
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-386bd881d39so5772081eec.1
        for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 16:14:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795652051; cv=none;
        d=google.com; s=arc-20260327;
        b=d7iL6Sf1hlOOxuWKAvt6GBvFukO7BJyQeikAjvPBbtEwwcBQjkoo/itGcsSB3WHBGe
         1xkQQKFPEHgqsIuw74grPgd3mSjy8V7YnOywDZYRoAHf+hE+ho4qmJTmGL0EPy0lTe1v
         ZAQNMGGTafftk4rmqWTBNZ4orIP5gBiS0Bs1LepXgFQEyebTK8YzpWoF5qb2UdrBDNs+
         L1Sxxb6AftdddYyWBw8yIgqhRlWiwvkmAe+eDji/IaqU16RMH9qokCzJMjZUt/llnu6i
         x2vqE2z0qPEpRoUdLCjnQ19lrNtwCxadcuJgtSDoOo4ZzB2nnrYO+roD+PljOcHoQDdc
         n0Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZyKI2qUNxqXt+wcWqV0BvUgrOWmkIinXejzZ4Is8tdg=;
        fh=J6o1sV3cECYZ1I8DdMmMcHl5EKG9hrWnqxsiZJlPizI=;
        b=dOwFt7NyRHim7ICfwHIth7/ojZZe7nHIanTLQir94y4ZYA++v/sFdEj9Ua4raWVmUY
         +gDn/Pz7OqkIbzaa/9hCEP2klDtQR3EFEIbOOQ6RXtaN+ePYMwdfzciqxE0eWcaHkiH3
         PPMvnZxX3EZP2Cv/YEzgJe6C7L3FKIdfj1ub4o6yLmvcjLyb+AaG3KJWsBuJ6qhzfJ5j
         TOwQULlOIBMbwG0zcyotYIrbDziGlhC26iCvPhR8qKelw9vHv8WDmvznImlwU5sn3gQc
         hYMbNhP6Me2uqLnarxAk5mnflW7YvFA1ala9XK7gbyBlY9naKcr4LTfsGtiF6pPBiTkP
         jYPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795652051; x=1796256851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZyKI2qUNxqXt+wcWqV0BvUgrOWmkIinXejzZ4Is8tdg=;
        b=Dhvbt+N64gW99NVUnyhu/sbzE7bHl8mg4Y/Rm8HapWPrrP8aSul6Isrm+8IxEkko8C
         YuhgCsq6ZVPqN5AI9m+SsEcvqtqn/VTtZHxqJyNigBPi9+qqCmyUYvMJbGjcNfjU3giK
         N1QkT80OL6NB0UX0oas2gDjH7R9bNOyLZTTT1poT+h0kw0qqjIZrHb+JQTFoScAWWVhg
         VBrpa4lmD6/Bd/nVDIany+3qtrPe3elApirp9Gq5XAs7HxnqHVVll8o9qYk0OoA8rEXY
         pOuz5s3n8N7SWWgf1ZSMUcf3lDzt4v0NEByyisQdzOW0gs/YGqRUN/gUpg/9uD57cAqY
         TtxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795652051; x=1796256851;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZyKI2qUNxqXt+wcWqV0BvUgrOWmkIinXejzZ4Is8tdg=;
        b=pfjngRrbiMzlHmqFGaz/sF1nMPcfxq2Mb9s7LoTjxrpq20ukcia7StVIkHn4PezJCl
         l7irAnpX/VbMgxEBsVpzhvP9vnqjzsMk9BVAQi+bAQ1axrSEZjxuFfGyyKWekWbLhOl/
         P43tWx2mI2wFZhjZSgRa4tD/tFqlsp3GS416i8j9Lsa6Hu+8+xJXrog1q9lOULcCeKUq
         I4zZs+UZiW2d1jbuKU/qbFDAdTQ3aiU70+pIEKRpWLD1YlHwtcxqGUjq9JD+e86X1F4d
         M8hudHNb3G0uJIzEdK7tt6Od/+gaZmYn5x27OUjRoQFHl+ahW7FsBZuSWy2tJLFi6FFq
         44+Q==
X-Forwarded-Encrypted: i=1; AL+hErE98jvtvP1yxqWK0wW4ceOsvAALtgSJ1Pn9QoLz1mB4ozVfj5Ow8gsdr1yKH96xXOUCg9i2b+bx/Btf@vger.kernel.org
X-Gm-Message-State: APuU4Z/3qdUpyPg5cDxzIcpbKFPEOAoHJ1eRdhQCrzLMHWpL4IOlwC+e
	KF7TQbhN1o8HdAo6SAZTzV+lNA+afH3TcNOIq1cpfoF1TI1H/7e1iBhdqH9nj77Y//7C1Buj6Dh
	TE3EX6McoCoEfuuKUcR6CvVZUHkZyVb4=
X-Gm-Gg: AZFdTZfX22h2E691FK2i2Y3loKuMszL4bn8A3/RNTXfnVglaH8kJCo69hiP6Wddplvw
	GJawVjcbno93JlO2UavOvxmf2JMVaS7SoAmLvRhcKb+DL4vcU9RHHqlPuOte4bZ6hmidWE10MWZ
	NhPMd1dI3fzhR+0d+ok9x4/YEoni7zkjMt12wmJ5zPYFHdbcmO6MUdYMzmfYeqXYJDWsL71S+t8
	EeVoTsTCXFVMBunTXlzXakMZM3nJxo5I2Pxs+5c8nXNjjgQb5YllYbhtJS6W9hM2UCYgS8IlbMC
	jzxCOHx1m0Qo9e90aL0ojTI7poXBlc9e6jmUsxRzWl+Rg5i8bVUTJdRsEBsvMel8vAn32/DL0Zj
	b9Wmbn88uOXXb+AIf7AOUQ1Wo6kq6XIsgrMuatv4=
X-Received: by 2002:a05:7301:c005:b0:386:a0c0:5e59 with SMTP id
 5a478bee46e88-386a0c0757fmr16642087eec.20.1795652051165; Wed, 25 Nov 2026
 16:14:11 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
 <20261125072026.2997493-2-prasanth.r@lineo.co.jp> <mo4vj2higl2dmabkeslouimdgoeofqlkyjnngytv5wmub2h4w3@t2ayiiw4qaoz>
In-Reply-To: <mo4vj2higl2dmabkeslouimdgoeofqlkyjnngytv5wmub2h4w3@t2ayiiw4qaoz>
From: Prasanth Ramesh <ragaprasanth@gmail.com>
Date: Thu, 26 Nov 2026 09:13:32 +0900
X-Gm-Features: Aa3M54oCRfqrPa_wvFbRD8sm2OXWz8lngNEw2_ns1ZE4Pa74ZiYvVwkIIJgdohE
Message-ID: <CAG7eodFb_-1RPoe8Ha97NhxWXo7BdBjkFvWNOQ7PqYO3U2KCXg@mail.gmail.com>
Subject: Re: [PATCH 01/12] rtc: snvs: clear the wake IRQ on unbind
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	imx@lists.linux.dev, Support Opensource <support.opensource@diasemi.com>, 
	Prasanth R <prasanth.r@lineo.co.jp>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, CL Wang <cl634@andestech.com>, linux-mips@vger.kernel.org, 
	Paul Cercueil <paul@crapouillou.net>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marco,

Thanks for the feedback. You're right, I should have added proper
error handling. I'll use dev_err_probe() and address this across the
series in the v2.

Thanks,
Prasanth

On Wed, Nov 25, 2026 at 6:18=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> Hi Prasanth,
>
> thanks for the patches, please see below.
>
> On 26-11-25 16:20, Prasanth R wrote:
> > From: Prasanth R <ragaprasanth@gmail.com>
> >
> > The driver has no remove callback, so the wake IRQ set with
> > dev_pm_set_wake_irq() and the wakeup source enabled with
> > device_init_wakeup() are never released on unbind.
> >
> > When the driver is bound again, dev_pm_set_wake_irq() finds the old
> > wake IRQ, warns "wake irq already initialized" and returns -EEXIST, so
> > the driver prints "failed to enable irq wake".
> >
> > Use the device-managed variants so both are released on unbind.
> >
> > Tested on an i.MX6Q SABRE-SD board by unbinding and binding the driver
> > through sysfs.
> >
> > I used an AI assistant (Claude) to find this and write the change.
> >
> > Fixes: e7afddb2b4d2 ("rtc: snvs: use dev_pm_set_wake_irq() to simplify =
code")
> > Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
> > ---
> >  drivers/rtc/rtc-snvs.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-snvs.c b/drivers/rtc/rtc-snvs.c
> > index d99a352d6..647952dcd 100644
> > --- a/drivers/rtc/rtc-snvs.c
> > +++ b/drivers/rtc/rtc-snvs.c
> > @@ -383,8 +383,11 @@ static int snvs_rtc_probe(struct platform_device *=
pdev)
> >               return ret;
> >       }
> >
> > -     device_init_wakeup(&pdev->dev, true);
> > -     ret =3D dev_pm_set_wake_irq(&pdev->dev, data->irq);
> > +     ret =3D devm_device_init_wakeup(&pdev->dev);
> > +     if (ret)
> > +             dev_err(&pdev->dev, "failed to init wakeup, %d\n", ret);
>
> If there is an error you should return here. I would also suggest to at
> a proper failure handling for devm_device_init_wakeup() on all the other
> patches, albeit these drivers may not handle it today. Furthermore these
> days dev_err_probe() should be used during probe, so you have a pattern
> like:
>
> if (ret)
>         return dev_err_probe(&pdev->dev, ret, "failed to init wakeup\n");
>
> Regards,
>   Marco
>
> > +
> > +     ret =3D devm_pm_set_wake_irq(&pdev->dev, data->irq);
> >       if (ret)
> >               dev_err(&pdev->dev, "failed to enable irq wake\n");
> >
> > --
> > 2.43.0
> >
> >
> >
