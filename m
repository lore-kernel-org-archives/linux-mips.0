Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44A541A57E
	for <linux-mips@vger.kernel.org>; Tue, 11 Aug 2026 08:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.217
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786437461; cv=pass; b=it0g4TGU7ZBtrRpiSp4hbGiT8by7nm5mPT/B45cW5FTVgMUJj1Aykot6ZCy1O4adPuQuc7KCZbD6MFut1pO86Zpz5uFA0Fxu+KLrTV4d7SZGtT2zvZtY70p+Ubp7OMfLYE0yb7cfOU1o3+aMs6rIMvNXrUTvGA9JaElEqkH6inU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786437461; c=relaxed/simple;
	bh=ZXk5r0T3jgiUlFwfNpJ48sIMdCN2R8H614Z5O7SgldI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=gdpQE6YaMxlX/b0z4OKLeotueRw1wm/pmY2f5OgA3cH5Co3LC0Jy5itI2sKHeHx8hAZz36U3kACI1eKSueXL9NwGsjV4azhLZVViI167fSmNskubTC5n44uUljGzu117jDAwbSTtDnRYghvdvP9n1qtKszmAYBpwKdP3ij1U4fc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=HxXMa/jv; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=LtgtSITn; arc=pass smtp.client-ip=81.169.146.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="HxXMa/jv";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="LtgtSITn"
ARC-Seal: i=1; a=rsa-sha256; t=1786437441; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=dq/lL92waABM5rMu4UDHBPjKRf64b5IBeotvRyptIwx8jRO6mlPRmUjHEnSXS5SFk2
    6rH9HgiytUUZP67zhqI9kdfyPFvq/fH7zIKQNO4mp+UKuWzLt/+vRJyrzsuIeaEmLQzh
    LEbuRzGOsih4J3wf6izKH6XzVPolwTV/lwvrv5Lrr0aVeJiDyfaz0u06qtK5m2ENZyGa
    zbz+JU62h7sJ+gt98cfnN4570UdQeMozSSfGUWIoUIekEZpr5MFMM0eDeK26Rz0IRPIw
    nWtxfIq3CSXcos2oX3lSFdYJqZ+JUm+hYMkfNI4sM7xC1g/e+KmbMbARNmxTzXIw//jb
    kROA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1786437441;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=ZXk5r0T3jgiUlFwfNpJ48sIMdCN2R8H614Z5O7SgldI=;
    b=Mu/0PYrpFlNeLrHSa5C7XRMbVvC9jTHftSTuG8cXapDEcNxM2G+mUVw338d9NqKGy6
    5vBvptMpWGDfRvWu5ssiEMilYWeBqLbDVMssB4+BVzsCmrAgKpp7F+d5R8pHkjfx7zdj
    D/kILqvZ4TzgJiEhwbk7OYsLalqbPsyCRwK93iTsmI1ZWGdNu/IaJg3DNhyr8quR2oEi
    ciWJbUggJFdMxGcyk+rChwUFqK9XRwtc+uEtbR8bBaVDt1VkBLLwVEoioPdmWLRI4mwY
    UiDlhOn7Fa8qQyM2OiPjpHj06TPuv7kbmmZt392nHAawfxMQRj9Z5ievjOgULwylOmqc
    kuFg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1786437441;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=ZXk5r0T3jgiUlFwfNpJ48sIMdCN2R8H614Z5O7SgldI=;
    b=HxXMa/jvAhwWGIqJEfN8TuyhDZPxZm1y4HHMIIgeh6pEyEuFcnHV9+q5YnH8ijGwCe
    DD0xaqLn18PPZtA2V7LH6MoAm/YUzJ30jUdkkWigmepjjucj1LmsvV+El6gV06nng3ez
    fMtqmXQeuKwA4dzHSyMd9Ms4ZHzeDs3Zz7p5AWR2zW/+KSpf34RdYmQkZ6Amj85RgqGD
    hUOE6luoR8gmsM4Cierfe2aUHaRTL1Oezs5ZtCZq5v88o81KexqrULCWbx2yWvtP4h6V
    5W2fNb7iUbhc708wh63CXXeOZAAQtKhgi3IE2g7qlHLwhecOY312m7Z7ao51FG9hBC7O
    eAQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1786437441;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=ZXk5r0T3jgiUlFwfNpJ48sIMdCN2R8H614Z5O7SgldI=;
    b=LtgtSITnGXXLkiUj5u6THZAuiWwBhYnNTuu45vr1ok+15Mvd4yX1zrN+f7MYOesTDA
    1gZ22cwkFRD3/AT1sLBA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQ35pdn8iNWEy2DUdv+aNBll2mJcegQ04/cGU="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.5.6 AUTH)
    with ESMTPSA id Q58eac27B8bLkCh
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Tue, 11 Aug 2026 10:37:21 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: imgtec ci20 HDMI broken
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <anhzkCYSyOt-5F4v@waldemar-brodkorb.de>
Date: Tue, 11 Aug 2026 10:37:10 +0200
Cc: linux-mips@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2A5E462B-CB0D-4B90-A112-1F349FAD9EAB@goldelico.com>
References: <ancr4X9BNc3S0sC3@waldemar-brodkorb.de>
 <0DFD48CB-3CA5-46EC-9501-72C68A1F9157@goldelico.com>
 <anhzkCYSyOt-5F4v@waldemar-brodkorb.de>
To: Waldemar Brodkorb <wbx@openadk.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)



> Am 09.08.2026 um 14:33 schrieb Waldemar Brodkorb <wbx@openadk.org>:
>=20
> Hi Nikolaus,
> H. Nikolaus Schaller wrote,
>=20
>> Hi Waldemar,
>>=20
>>> Am 08.08.2026 um 15:15 schrieb Waldemar Brodkorb <wbx@openadk.org>:
>>>=20
>>> Hi,
>>>=20
>>> I recently played a little bit with ci20 devices.
>>> It seems HDMI is broken in Linux 7.1.6.
>>>=20
>>> Here is the kernel oops captured via serial console:
>=20
> [ removed oops ]
>=20
>> I am not sure if I did see the same error but I recently did a fix =
for bridge allocation (not submitted):
>>=20
>> =
https://github.com/goldelico/letux-kernel/commit/9d039bd064094b176825da9f4=
71e9c4447674703
>>=20
>> Please let me know if it works. Then we can post it.
>=20
> Yes it works! Please post it. Thank you.

Great to know. I will add some Tested-by:

Please remind me if I forget to post it in the next weeks...

> I have seen your Linux fork Letux with audio support for CI20, are
> you planning to bring this upstream, too?

Well not really as it likely has not been tested beyond compile tests =
(at least I am not aware of).

But it is good to learn that there are still some CI20 boards and users =
around...

BR,
Nikolaus=
