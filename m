Received: from smtp-out4.electric.net ([192.162.216.184]:52007 "EHLO
        smtp-out4.electric.net" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992105AbeDMPkRdP8c2 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 13 Apr 2018 17:40:17 +0200
From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH v3 2/2] MIPS: io: add a barrier after register read in
 readX()
Date: Fri, 13 Apr 2018 15:41:00 +0000
Message-ID: <e38a329dfb9c461ab3e91de7b96db3dc@AcuMS.aculab.com>
References: <1522760109-16497-1-git-send-email-okaya@codeaurora.org>
 <1522760109-16497-2-git-send-email-okaya@codeaurora.org>
 <20180412215149.GA27802@saruman>
In-Reply-To: <20180412215149.GA27802@saruman>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Return-Path: <David.Laight@ACULAB.COM>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: 'James Hogan' <jhogan@kernel.org>, Sinan Kaya <okaya@codeaurora.org>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "arnd@arndb.de" <arnd@arndb.de>, "timur@codeaurora.org" <timur@codeaurora.org>, "sulrich@codeaurora.org" <sulrich@codeaurora.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <20180413154100.o2dnPJNJuKhiYdwP4w9AnY4Xab3YtiVK6ntiytjxlak@z>

RnJvbTogSmFtZXMgSG9nYW4NCj4gU2VudDogMTIgQXByaWwgMjAxOCAyMjo1Mg0KPiBPbiBUdWUs
IEFwciAwMywgMjAxOCBhdCAwODo1NTowNEFNIC0wNDAwLCBTaW5hbiBLYXlhIHdyb3RlOg0KPiA+
IFdoaWxlIGEgYmFycmllciBpcyBwcmVzZW50IGluIHdyaXRlWCgpIGZ1bmN0aW9uIGJlZm9yZSB0
aGUgcmVnaXN0ZXIgd3JpdGUsDQo+ID4gYSBzaW1pbGFyIGJhcnJpZXIgaXMgbWlzc2luZyBpbiB0
aGUgcmVhZFgoKSBmdW5jdGlvbiBhZnRlciB0aGUgcmVnaXN0ZXINCj4gPiByZWFkLiBUaGlzIGNv
dWxkIGFsbG93IG1lbW9yeSBhY2Nlc3NlcyBmb2xsb3dpbmcgcmVhZFgoKSB0byBvYnNlcnZlDQo+
ID4gc3RhbGUgZGF0YS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNpbmFuIEtheWEgPG9rYXlh
QGNvZGVhdXJvcmEub3JnPg0KPiA+IFJlcG9ydGVkLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFy
bmRiLmRlPg0KPiANCj4gQm90aCBwYXRjaGVzIGxvb2sgbGlrZSBvYnZpb3VzIGltcHJvdmVtZW50
cyB0byBtZSwgc28gSSdtIGhhcHB5IHRvIGFwcGx5DQo+IHRvIG15IGZpeGVzIGJyYW5jaC4NCg0K
RG9uJ3QgeW91IGFsc28gbmVlZCBhdCBsZWFzdCBiYXJyaWVyKCkgYmV0d2VlbiB0aGUgcmVnaXN0
ZXIgd3JpdGUgaW4gd3JpdGVYKCkNCmFuZCB0aGUgcmVnaXN0ZXIgcmVhZCBpbiByZWFkWCgpPw0K
T24gcHBjIHlvdSBwcm9iYWJseSBuZWVkIGVpZWlvLg0KT3IgYXJlIGRyaXZlcnMgZXhwZWN0ZWQg
dG8gaW5zZXJ0IHRoYXQgb25lPw0KSWYgdGhleSBuZWVkIHRvIGluc2VydCB0aGF0IG9uZSB0aGVu
IHdoeSBub3QgYWxsIHRoZSBvdGhlcnM/Pw0KDQoJRGF2aWQNCg0K
