Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795198400;
	b=JNer7KtIvI1+oKLc0iaXoNOgw87wcU8efG1YoOhfMYveIB+OCJdT80MRDz87hab7Q26r
	 XaQpreNMYDS45y0t/y9ydxuFToqoISdtR2dXkWemSaMqeIMQp3IlJg6bK5+/gNRo1Oq3C
	 kZs1X745yvWU4cqLw2gtKsuUK7GNvTR0EmA9e8AQEX78FlzrYzlkhPjtY3w2rjeHn+AP0
	 NBmoPiGjI2OT3uhw/CGTUmRw3EZVkq8bB39fVKFPgIpkwLzumIEFCC7+yPsh6NWRiYtS/
	 vM04z9vITCfZxToFBdWstcrbim5eLI9e+gE9wKRsmEFwBcccxTEDd6ZQ2VlOL3+Ms3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795198400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=oidvo6PpYzFoB+4JyNdN3ZrBRB9jo1ImxetzExbVmTU=;
	b=nFT18SmWurSwrtBRbb+MzSmphB800Vi4b1cMkivg+xcx+rnU8564pfDE3gW7+3SIwDex
	 e8zRlctc8hTYlWjmfGk4QH57H8iLhEADiisl+0jeRHHiZ2Bk+dDwxzqo7kuvYCS4NlNK7
	 4k4kh984dtSvT2BoLbD+YAFoJJSjXeZBnbHJZbDno3gdUtOrKv75HcusAhw7x4DLURFzG
	 n4ClRmEEAZh7EtaGCI4qC/h41tK4NLXJCB7aCRyjAA/9SGlGz5sF8nVGAH7awwkODrjmB
	 Eow+5W4AFUC1S+UxeFxU/mVaYjwK2VrD9v1eoQtncBlnAbqjr7ClogBefaSKgvzBrXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ZaGSuDy;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9BB606B9A6
	for <linux-mips@vger.kernel.org>; Fri, 20 Nov 2026 18:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF9BB606B9A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ZaGSuDy
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91e7fc8265aso15403516d6.0
        for <linux-mips@vger.kernel.org>; Fri, 20 Nov 2026 10:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795198398; x=1795803198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oidvo6PpYzFoB+4JyNdN3ZrBRB9jo1ImxetzExbVmTU=;
        b=0ZaGSuDyeUEPpYIJz9D3/mrE7uSERI4S01BhMBly9pDPEbZE0OcJmrtz8Y5VvLH3Gj
         xKFXteozeWuhMYAX16li6vOwnt07M79tqFYKrm3pKC5uLbiDyB8bdD27ipJ0Ade1OhgC
         XFEynm4OvVDuv47NF1vP20F1hEkJRkHZmVuks6RIIklS9sjDJUfPh8mAK5dtVHO3JXPO
         wAXiulFFrw9lQJGH7Q7XyKRg2nsEhTulLYkGhK34gqEU2JfIrQBSyequ1JFrYuNGA9Oy
         x/Gpq5ygctt1B7fHBG2C61izOmkaKJuFWnHtt6naS+INZShm2Labe5EskMowrDFtbRTY
         zR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795198399; x=1795803199;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oidvo6PpYzFoB+4JyNdN3ZrBRB9jo1ImxetzExbVmTU=;
        b=EOVvRbw0xiqvCgB+lgXNtAj94g73p3KfeRYnNOZK9RTGVyd+ONWzmbVhA/nYvhUfsq
         BuXcqgjZAA+lYgvMo+M1s6FECXcMmI/vpsT75Rs9YAGsS4fhkVb0eo8OSlwAvLyh6aV9
         e4kDjwYHToRCX62s93Lm7TE6L0lDS1qgZKy73xBE++oC6rV7OKW2e7B8w5Ot52O44ZHF
         WeGk6ueIxyJLeXXN7ngf4b2RD50hxQmLq8NJcLyuYq2gx51Ix5HEpcZdtLcFhAGX0RmQ
         1DIJSpQ9u+M9UJe9xTIpT9r+1dAH8z5kAS59s2EdAcyKeWbmzy30QkjFFql3srCFgnZS
         i9WQ==
X-Gm-Message-State: APuU4Z9do3AlFlM1p/WxN2BNbHl5j+SNynPJVCexXkH2peJAPnuP8m6j
	CDycZjk8R0/dyMBR+Fm/4+bQbn5qD1mMwnAO/bhssDqJcWt36i7AKNxD
X-Gm-Gg: AZFdTZd4KLqkjMngzopsn0Nk19FFbfyAdmK4IvXkNftBpU85GUnPjN+OmMvBWbfh7/y
	kMuS03eS+cKslDrg+YCCDNlv7YmR6BN7sQwySmco7IjuaigV9KQ8rLqdo1YKYkM6i8yDM5cVkwQ
	uXJ4zMwBoqYaKGIe7Mhzg9ZzR3LwgwxiXbjg5M83O8d7FxjtrNtn94L7s55FzC5SSZadywYgBTQ
	nj28x9AEPnpULFtQvJCbKRZBVJs0kqUNG/TDEfZBRR1S/SzhNbI2JGxlBYDRZs5k3iao9v1HKbZ
	N3wdwQU6E5DrB18axg15ligjgdKkLXCX/wLkL2Fm8Kj0t4fGf2TESK64gdedk9NCQ2ispk7FQkz
	v1yVPnXuvPl3fIKvzLkh9wF2Ehakt2iVHZCHh7MF5TX5N5EoXloIHPUs1DMbbvsXwOLvJk2qjAM
	1ibY3uCbo2M08nXY/MUxXCfxpYh2bAYl5JCW64GYrlX9LdQ8tFwhbQ/19dWzesPZYWcQ6J5kZU7
	PmgEMqKdEvQIPIF9djj2i7NHUdByJZv4XS2MGK2/uwMV+DJJfVuxXVtOPV7IkXUl5GFerMtj+Jg
	lfIMBU20dgg4QRZfZq2Ql3+S+OP37dFz7z7aoQEaNKhoAJxGgZh50siQ
X-Received: by 2002:a05:6214:c6e:b0:91e:d612:a120 with SMTP id 6a1803df08f44-921347740ccmr66147836d6.0.1795198398604;
        Fri, 20 Nov 2026 10:13:18 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b50besm31921776d6.9.2026.11.20.10.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 10:13:18 -0800 (PST)
Message-ID: <f82422b6-20ca-4c47-b420-156ae6912dd3@gmail.com>
Date: Fri, 20 Nov 2026 10:13:16 -0800
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MIPS: Ingenic: Allow assembler reordering in the XBurst
 secondary entry
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 open list <linux-kernel@vger.kernel.org>
References: <20261120050827.804767-1-f.fainelli@gmail.com>
 <alpine.DEB.2.21.2611201404490.54328@angie.orcam.me.uk>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2611201404490.54328@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 06:06, Maciej W. Rozycki wrote:
> On Thu, 19 Nov 2026, Florian Fainelli wrote:
> 
>> Remove .set noreorder and the two explicit delay-slot nops from the
>> XBurst secondary CPU reset entry. GNU as emits identical reset-entry
>> instructions with reordering enabled in both the CI20 and generic
>> MIPS64r2 Ingenic SMP builds.
>>
>> On CI20, two baseline and three updated cold boots brought both CPUs
>> online. Each boot passed the CPU affinity check and 100 cross-core
>> idle-wakeup round trips in each direction. Codex assisted with the
>> assembly comparison and hardware test campaign.
>>
>> Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>> Thomas, feel free to fixup into "MIPS: Ingenic: Add XBurst SMP support"
>> if that is simpler. Thanks!
> 
>   Have you compared objects produced to be the same with and without the
> change applied?  If they are, then:

Yes I did and they were the same.

> 
> Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk>
> 
>   Thanks for this follow-up cleanup.

Of course, thanks for all of your excellent feedback as usual!
-- 
Florian
