Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD64A40DFCF;
	Sat, 25 Apr 2026 17:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777136631; cv=none; b=Csg+pGeYDDAjVYw1Ln5yZR+WqN3Xvhb2gwACjZRGeLyPUXM9C1jftjLXI2A1RdTPH5qykZvlUSKPOKtxrqyA1ohbw+gyqRhr7RxZ0w/dflcAYJwx7U5f0oFWsvXRGJLb9N/ts3rwL7HhOJ/KXJEEHmEpW2pb2dQhFu+8qIEKJno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777136631; c=relaxed/simple;
	bh=ODFP+i2oEkBlLUBrhXb9K0Ao6WjgGBH8TfXySBaOfeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n1FhA+lE//pju/VyKq+7DY+wJX03J+Z6ecIEfHNIRPMn1UNZ0Pu4yp57lQoJUUIXgjmrl2Cm3WzU/45nhGoo92/8dYm9/mUPOFSwsZ3hj6P1HXTCxdjlvjvA2InfYjc3aDRCxZq7jvkthSnD2Cjkg3PTmAjf2fsM7J2IBUyVQ48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=T2cDReam; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="T2cDReam"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14D221EAE92;
	Sat, 25 Apr 2026 19:03:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1777136625; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ZBGrKF64afHmhXrSaDo+ek9+EFFN0jMYF5rAjSpYwrY=;
	b=T2cDReamUTG9cUUSHENBWu11lyBJAaH4/hsxU58MFhChGcpdtv+sHj4dXaj1Sg0kjwaBWl
	t4rY61ngXArikGIfODNqTZ1F/cUG9eyhJCLiyz4GBnTDZS1lSvNvreTuFVuI5ecSoNhALy
	nOun2gJCxiADMhAaINatN+1fAY1E0GnDqOgU37TEGqt9fARKfZScKlaXf+wUpu5EyY4jN8
	2WcWoZcXckgNM+jNtV6PaV/LoXzbeuRSDi1ihIpBux/VSwM2TfIszC3MQiF42xBsZVadi9
	sXFcD42G3TYWCz+1mqB8pFY8HDOsaQ0e6zgx5jAd+9uEfdMeUI2o8F8dapRkiw==
Message-ID: <4d50bb7a-7aac-49ed-a5ef-816f3d0ad8b3@cjdns.fr>
Date: Sat, 25 Apr 2026 19:03:41 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: econet: Add CPU
 interrupt mapping
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: tglx@kernel.org, conor+dt@kernel.org, linux-mips@vger.kernel.org,
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260425123531.270548-1-cjd@cjdns.fr>
 <20260425123531.270548-2-cjd@cjdns.fr>
 <177712370148.1527749.7565214035200790095.robh@kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <177712370148.1527749.7565214035200790095.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

> My bot found errors running 'make dt_binding_check' on your patch:
>
Gonna blame this on not doing `pip3 install dtschema --upgrade` often 
enough.

Fixed but will re-send in a couple of days so in case of other notes, 
all can be addressed together.


Thanks,

Caleb

