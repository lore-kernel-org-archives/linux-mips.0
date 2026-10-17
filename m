Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D769F3AAF5D;
	Sat, 17 Oct 2026 07:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792222350; cv=none; b=f4XnCsXjATcdEhz7VTORr/SeCU4rBpr8DiIfwzSuxRAo+057ajbMsIwH6u/Nj+oAy2CaqTDzyPKRHyG4NxB6JzJQvj62pvaeaiORC/9lD9DmGNezGew9JH0505FOmIFed8+XqA8h6GLUecv5pWKU+eaOO9ZeND9bsC/7mJlQpgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792222350; c=relaxed/simple;
	bh=DucJ+GSIRsodPBILFtCADfkd4KyeT/9fjTyAH5UQzU0=;
	h=Date:From:To:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=JrlcHcPENWetnX0QWV0TgnWAyB1Gco28XZfhVpNc0skYkP57YoAHC7E/CvKVIhRS9OrC1epaNaDtNKzW3mfQ2BxAH1mUGOXFFeXRgwcyhkFb//U7He6DqD4zcwuNrnJLGpGZDqLmepiZ3xQykSooiaApC/IuQ218pIqXjQgb/0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=WuksxknM; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="WuksxknM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=DucJ+GSIRsodPBILFtCADfkd4KyeT/9fjTyAH5UQzU0=; b=W
	uksxknMSYYKZsmhF5G2J1x31xgdV22bPxGPB+QRQZTHoF+Ev0Xx8u4KbjzjgIcFo
	4zDVnANhIAK9kJiYQJbHWuSWNi1xpJJwM/3v1ZuqBmc8Kf6JUU6Vgwi/uZ9RTAj5
	hRdU/2kn3g/2XrQjQamDJQ06hVvbnpEUr1V+7YswOo=
Date: Sat, 17 Oct 2026 15:32:05 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Huacai Chen" <chenhuacai@kernel.org>,
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>,
	"Thomas Gleixner" <tglx@kernel.org>, "Radu Rendec" <radu@rendec.net>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH 6/6] irqchip/loongson-eiointc: validate MADT BIO-PIC
 entries
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261016141357.2793046-7-yaojiale02@163.com>
References: <20261016141357.2793046-1-yaojiale02@163.com>
 <20261016141357.2793046-7-yaojiale02@163.com>
X-NTES-SC: AL_Qu2SAP6ZvUsp4yiYbOkdnEkQgO0/WsS1vfQu2Y5Wc+wEgCbN4z0YdHxaDHHN8e6DOSarnDiOagNHzNRcb4JHLtBBP1dGBxnI8XOWQBkNAw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <6f31bbc0.1860.1a148c66c3c.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZygvCgBHhzt2JNNqgPtaAA--.141W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRa172rTJHYShwAA3-
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMC0xNiAyMjoxMzo1NywgIkppYWxlIFlhbyIgPHlhb2ppYWxlMDJAMTYzLmNvbT4g
d3JvdGU6Cj5UaGUgQklPLVBJQyBNQURUIGNhbGxiYWNrIHJlYWRzIHRoZSBjb250cm9sbGVyIGFk
ZHJlc3MgYmVmb3JlIGNoZWNraW5nCj50aGF0IGZpcm13YXJlIHN1cHBsaWVkIHRoZSBjb21wbGV0
ZSBmaXhlZC1zaXplIHJlY29yZC4gQSB0cnVuY2F0ZWQgZW50cnkKPmNhbiB0aGVyZWZvcmUgY2F1
c2UgYW4gb3V0LW9mLWJvdW5kcyByZWFkIHdoaWxlIHNlbGVjdGluZyB0aGUgcGFyZW50Cj5kb21h
aW4uCj4KPlZhbGlkYXRlIHRoZSBCSU8tUElDIHJlY29yZCBiZWZvcmUgYWNjZXNzaW5nIGl0cyBh
ZGRyZXNzIG9yIHBhc3NpbmcgaXQKPnRvIHRoZSBpbml0aWFsaXphdGlvbiBoZWxwZXIuCj4KCkZp
eGVzOiBkZDI4MWUxYTFhOTMgKCJpcnFjaGlwOiBBZGQgTG9vbmdzb24gRXh0ZW5kZWQgSS9PIGlu
dGVycnVwdCBjb250cm9sbGVyIHN1cHBvcnQiKQoKPlNpZ25lZC1vZmYtYnk6IEppYWxlIFlhbyA8
eWFvamlhbGUwMkAxNjMuY29tPgo+LS0tCj4gZHJpdmVycy9pcnFjaGlwL2lycS1sb29uZ3Nvbi1l
aW9pbnRjLmMgfCAxMCArKysrKysrKy0tCj4gMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtbG9v
bmdzb24tZWlvaW50Yy5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1sb29uZ3Nvbi1laW9pbnRjLmMK
PmluZGV4IGE5ZThiNDgxZDMxZC4uZjkyZTc3MDIxOTVhIDEwMDY0NAo+LS0tIGEvZHJpdmVycy9p
cnFjaGlwL2lycS1sb29uZ3Nvbi1laW9pbnRjLmMKPisrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEt
bG9vbmdzb24tZWlvaW50Yy5jCj5AQCAtNDU0LDggKzQ1NCwxNCBAQCBzdGF0aWMgaW50IF9faW5p
dCBwY2hfcGljX3BhcnNlX21hZHQodW5pb24gYWNwaV9zdWJ0YWJsZV9oZWFkZXJzICpoZWFkZXIs
Cj4gCQkJCQljb25zdCB1bnNpZ25lZCBsb25nIGVuZCkKPiB7Cj4gCXN0cnVjdCBhY3BpX21hZHRf
YmlvX3BpYyAqcGNocGljX2VudHJ5ID0gKHN0cnVjdCBhY3BpX21hZHRfYmlvX3BpYyAqKWhlYWRl
cjsKPi0JdW5zaWduZWQgaW50IG5vZGUgPSAocGNocGljX2VudHJ5LT5hZGRyZXNzID4+IDQ0KSAm
IDB4ZjsKPi0Jc3RydWN0IGlycV9kb21haW4gKnBhcmVudCA9IGFjcGlfZ2V0X3ZlY19wYXJlbnQo
bm9kZSwgcGNoX2dyb3VwKTsKPisJc3RydWN0IGlycV9kb21haW4gKnBhcmVudDsKPisJdW5zaWdu
ZWQgaW50IG5vZGU7Cj4rCj4rCWlmIChCQURfTUFEVF9FTlRSWShwY2hwaWNfZW50cnksIGVuZCkp
Cj4rCQlyZXR1cm4gLUVJTlZBTDsKPisKPisJbm9kZSA9IChwY2hwaWNfZW50cnktPmFkZHJlc3Mg
Pj4gNDQpICYgMHhmOwo+KwlwYXJlbnQgPSBhY3BpX2dldF92ZWNfcGFyZW50KG5vZGUsIHBjaF9n
cm91cCk7Cj4gCj4gCWlmIChwYXJlbnQpCj4gCQlyZXR1cm4gcGNoX3BpY19hY3BpX2luaXQocGFy
ZW50LCBwY2hwaWNfZW50cnkpOwo+LS0gCj4yLjM0LjEK
