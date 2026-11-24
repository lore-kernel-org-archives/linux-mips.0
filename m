Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517653;
	b=ewjwnAPmOnSE9PZfRLYbNFweiQgHGdoSj6meatjOw2/XE2t128pW/gfa/kveJ4Ko0GX6
	 HwSxEXYmiUElYbijVINdeOLoJNyqUAdPHlZp9iZ1tx10T++EElzL9fw2aFNmbpJNwHOG6
	 R8fjqhLVUgfII7I2rytluCcyWgg0oh1KVjHEHqdM8Eajw3Dce6faUwuARs2USp6KMcy+0
	 5f8llgrfoAcFZD6mxQ0ehXriLAbmlkrpClqXwM4ZRtiVsnKGHU0QnkPAC5Cbii76Euk6j
	 rK5z3ysR/UU+aJ42rcmYPzYddZBdVk7cvxJbigcQuDzxRx8k/vaQshpPV8RQofp12nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517653;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=I/zIe5VWqw8+S0/CxPV6Xop+uxmy5kge68ZkVSiQml0=;
	b=UyIoAKr1bKr9D8k1kuS5SPODiHL6OxafLOaUKhp5W2Ip35dNZQgRHEAgScC2FXs8Y+6p
	 E0neZnXD8pqZ4M5lkbrHElwXbt7BhpNLw40YOMQtTdYKZfhAIoenKgywFT0fahitE6r22
	 a3qJhBb9d5oLvf1oxuvze6dprfMXE8pMPTIzJkVt+2MAwkGUmYets2DT60EYDB+nLdc4l
	 EZ1jgTR1/Orkk46OjW0RcCkSpw4VhJSd3eGkCNNkawSktRdL+pNoUEstLSM0Rzl0G9ap0
	 wv3mJOpt8lNWr3w879Fd4WFlZ+MRaiuKTVBxJJZc/wzJhjl27yvpfh54R33s5NbVDiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Ottftt1B;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=N71Ui9Lb;
	arc=none smtp.remote-ip=202.12.124.152
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08D3606A31E
	for <linux-mips@vger.kernel.org>; Tue, 24 Nov 2026 10:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F08D3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Ottftt1B;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=N71Ui9Lb
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 41BE97A051D
	for <linux-mips@vger.kernel.org>; Tue, 24 Nov 2026 05:54:12 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 24 Nov 2026 05:54:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795517645;
	 x=1795604045; bh=I/zIe5VWqw8+S0/CxPV6Xop+uxmy5kge68ZkVSiQml0=; b=
	Ottftt1BFIfOuEqCt8XeAUqMffBIJ+4igLf7CXsA/NdF1mCtbMtnpz/AHGyYpAJN
	rVJM2Blz4cCY65pgR3cOkjgPEFqc1bQC19m80vqns0jLMmg3g/LCv+46LMkuXJyR
	5DQDef7dDjqWhXK0ENKE+Zlr2+UCR86NlaKNZtykNEvXBwJA5QXAJG3ourCj++yF
	D7zNhRvV3/AFQbJOZigeAc5dcw20+YivH5p5U/VodPQPDFdRn5Buc8FEg9cKNQSw
	acfFxxGlqZ75c9BA/SGoXWoL5rjzk+W28V6UWppgQcvxaKgmTG7rCKamo/qGfdW2
	coUlzQMVACK+f4HOxiBiCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795517645; x=
	1795604045; bh=I/zIe5VWqw8+S0/CxPV6Xop+uxmy5kge68ZkVSiQml0=; b=N
	71Ui9LbvWGXzA5LjKPeM1OTlX40g48oBMmsfwmkA/CKb5YGpSMs9N1Zirgeew4i/
	2bNVmXHEHFaw99558izOsvL7484Q2Xxo4wc0UbfzkMZE59ckgM3FqzBpFK8jNO1I
	68yWbzhto+tbk9aKSeKOnM3BCVOggCGmTysFXwVHSwfQ9h4wV+5L577j1nNevPQA
	8ixvAjNiuCVJn47eCHUMA7ubbGR/PFOXNBpmxEaxBYY1HTG3jVDs16GZIb0HdXQm
	EXpYR9vIEAondYJrXlDMAC6QQUdjdqgcROzlKnzv83AEEpVPfqB6+ISZhevt6CCX
	vQP6R8LatdG/+2tbRLCZg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795517645; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LW1pcHNAdmdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:hURmgVw4Qe9Ia3MhUK9aI7tN77DqCY4Kc7qha15CGyo0HkY
	icZfCc1x4DW8/W6Clx/kAWlabdL7ue4VEp310hFLhv2ZeXtRBo+CwneQCWLh+FNf
	961UuPZgo9AebYg/NtD/xLIWB9ohHfwywtExOrvzled8pPdLsSOQabWnyE7DSyB/
	9T+ppjVpP+MCA3/k4ceH9LI/Bb4ppmjtRPV4KTDIJVI9G2b9xVS+sqeGiC+liBjs
	LA+ul8xQ5Ywbz2KcIxYQGVp9qlnwrMCTaVqndxswKycMbZ529pvAOq+TkVyyE2NV
	s4nZ4IfZIlNrj2m5RwdB0cTkT6QrJQ9gT5XOAzQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:qaUuqfRbwycq3sQmP4C2zJuSQHDasB36WmiAes4gQ5E=:99SLvjv94WBAtXwnVfHBivKj5m04d811A0daBUjI5ao=;
X-ME-Sender: <xms:yWwFa55tJfFwBKcna9sOv-rxn8Y7Jmm6IGpBxblWTXL4PZOvyAAluA>
    <xme:yWwFaxt0ojozunMiM_zaH7QfVbzKjf6qIOwLMv3GiBSyUDAfQTpBcb0DQILe_I8hz
    wLgsixtmtEPbwV6pLRs4j2hqKG2RID9hDU1K_rYYMU8_TEA2tJYc6I>
X-ME-Proxy-Cause: dmFkZTEXP003WlrYk1tyY402XwYF1VaFe/m4y62XO9fh81zbtJgx9Ny4RQkh2NSS+6DpfX
    pkzDCkFstx/lBPnZY8i0hFxeXqJf85LQFHjIixebnbGtumOcJrTZ+rMPIolAIX3TbWsIkM
    2PwaVFyIjLa+NqD+M308chQInLu3EV+vVDISnyhhr4/AsFkC4ExHE7J4wjtIegWmvXZ6In
    W/xYbWBmwk0XhPNj3Caf0IDs+IcPeliFiBQC2oT4OicmsbSVjOAXJm4vo24uF1iMMtqchT
    EpcT9FJj4O/m4crJADFfJxrNk1hEqh84+UoSB2IFqy3kW9AgEd/HSAaACZlBNOI2/I85gU
    C6QwIPqJsnnTFaQcPiG6fI4DHtsUnvCD4wIxGZf8Rt+NfAJLtzTivCsK0/9trq4sUnKU3h
    kJwfIiq0UGzM3of8atF/b17Z9zD/aR2Y2RfRNcP69fZNZzJ8f4Q4QHNNW64mRZpoWoZgdh
    /AahtRVpc395rRPG1/OtrXkvJqEYfwmCuPUQwBOXhju77CdGGiyZNPIzOYauqBpd/CYD6u
    QXNoKr7yokQrIS5r44KuN0r9MusNCg3jIjqw0EG1xYT0CA7VLjOOVyvmOqrcWHHKebNJ35
    1xaEqLsbk+i0cOECvN/Vfdw/BfuFCGJd9EF+MkojNtmfmM0KAQqvThsPgdLA
X-ME-Proxy: <xmx:y2wFa1jIiKbOTfqopUdM1aaoyclbSzCDfX6IKQrGkCUOD0voqvi26g>
    <xmx:y2wFa139Inq-EvuaXM3J9VQmsfKly9Ps5hkO3Od3eQwX8Nxv5SAbPQ>
    <xmx:y2wFa7iSqsMvURMY6DS_aqub-Jj5jc25AAMW_5GTlxdvfc39AbtlnQ>
    <xmx:y2wFa2_NPPXHO8bHnrY-VHDlZhA2zZxyUqRQPBbPx15Q6PfNyYli_w>
    <xmx:zWwFa-CgxWM_YwtnrxP4nF-0w0Xl-Ar2_FP-OzbT-xUn6eGY9w1f_--o>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 1F24332A009E; Tue, 24 Nov 2026 05:54:01 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AS3EG-ulzzHR
Date: Tue, 24 Nov 2026 11:53:40 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Bartosz Golaszewski" <brgl@kernel.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Kent Gibson" <warthog618@gmail.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-sh@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-wireless@vger.kernel.org
Message-Id: <7e04f3d1-df93-459c-85c5-9e57dc1c3cde@app.fastmail.com>
In-Reply-To: <2f25009cbd67a8ee7b417f12b35374b1@gmail.com>
References: <20261123085723.156933-1-arnd@kernel.org>
 <tdc6h325jthjgyik2ne4oistkm563maoc2cpnffqu7hh34tpl7@oscripzv4dwq>
 <qvmy7iaxc7cjy2gkajqkr5ma6b4lwxz5ff64a5zsqrgewkxodr@odbjlv5x3hix>
 <8296a5c2-0aa2-4fc7-b65b-9d336bc4dff6@app.fastmail.com>
 <7dpg3x3gkypkznzhuetjsqmk5fhqwuwkc6kupbs52zqh5mibgx@fjow6eodw4pf>
 <2f25009cbd67a8ee7b417f12b35374b1@gmail.com>
Subject: Re: [PATCH 0/2 v8] gpiolib: finish the legacy cleanup
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 24, 2026, at 02:10, Dmitry Torokhov wrote:
> Hi Bartosz,
>
> On Mon, Nov 23, 2026 at 04:41:32PM +0100, Bartosz Golaszewski wrote:
>> Can I apply v7 and provide it to the SH maintainers on an immutable
>> branch?
>
> BTW, I have the soc_button_array rework (converting it to software nodes
> and dropping "select GPIOLIB_LEGACY") on an immutable branch based on
> v7.4-rc2:
>
> 	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git 
> ib/7.4-rc2-soc-button-array

Nice to see that this is ready.

> I recommend pulling it into the gpio tree before applying Arnd's work so
> that x86 builds with INPUT_SOC_BUTTON_ARRAY enabled no longer pull in
> CONFIG_GPIOLIB_LEGACY either.

I don't think the order matters, my patch 1/2 just won't have an
effect on configurations that enable INPUT_SOC_BUTTON_ARRAY until your
patch is merged.

     Arnd
