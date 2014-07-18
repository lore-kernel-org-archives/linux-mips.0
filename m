Received: from mga09.intel.com ([134.134.136.24]:34128 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6861343AbaGRQePh03jh (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 18 Jul 2014 18:34:15 +0200
From: "Keller, Jacob E" <jacob.e.keller@intel.com>
Subject: Re: [PATCH 0/25] Replace DEFINE_PCI_DEVICE_TABLE macro use
Date: Fri, 18 Jul 2014 16:33:16 +0000
Message-ID: <1405701196.21801.3.camel@jekeller-desk1.amr.corp.intel.com>
References: <1405697232-11785-1-git-send-email-benoit.taine@lip6.fr>
         <1405700934.605.31.camel@jarvis.lan>
In-Reply-To: <1405700934.605.31.camel@jarvis.lan>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD9845FD8478314381700031D1A8C64A@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Return-Path: <jacob.e.keller@intel.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "James.Bottomley@HansenPartnership.com" <James.Bottomley@HansenPartnership.com>
Cc: "devel@linuxdriverproject.org" <devel@linuxdriverproject.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "MPT-FusionLinux.pdl@avagotech.com" <MPT-FusionLinux.pdl@avagotech.com>, "linux-hippi@sunsite.dk" <linux-hippi@sunsite.dk>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "linux-pcmcia@lists.infradead.org" <linux-pcmcia@lists.infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "users@rt2x00.serialmonkey.com" <users@rt2x00.serialmonkey.com>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "benoit.taine@lip6.fr" <benoit.taine@lip6.fr>, "linux-acenic@sunsite.dk" <linux-acenic@sunsite.dk>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "wil6210@qca.qualcomm.com" <wil6210@qca.qualcomm.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "e1000-devel@lists.sourceforge.net" <e1000-devel@lists.sourceforge.net>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "ath9k-devel@venema.h4ckr.net" <ath9k-devel@venema.h4ckr.net>, "ath5k-devel@venema.h4ckr.net" <ath5k-devel@venema.h4ckr.net>, "industrypack-devel@lists.sourceforge.net" <industrypack-devel@lists.sourceforge.net>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Message-ID: <20140718163316.o8UGFZdDbc_NizpO0z_HFcpSSfwerHIWPJ3Ok99rth4@z>

T24gRnJpLCAyMDE0LTA3LTE4IGF0IDA5OjI4IC0wNzAwLCBKYW1lcyBCb3R0b21sZXkgd3JvdGU6
DQo+IE9uIEZyaSwgMjAxNC0wNy0xOCBhdCAxNzoyNiArMDIwMCwgQmVub2l0IFRhaW5lIHdyb3Rl
Og0KPiA+IFdlIHNob3VsZCBwcmVmZXIgYGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkYCBvdmVy
DQo+ID4gYERFRklORV9QQ0lfREVWSUNFX1RBQkxFYCB0byBtZWV0IGtlcm5lbCBjb2Rpbmcgc3R5
bGUgZ3VpZGVsaW5lcy4NCj4gPiBUaGlzIGlzc3VlIHdhcyByZXBvcnRlZCBieSBjaGVja3BhdGNo
Lg0KPiANCj4gV2hhdCBrZXJuZWwgY29kaW5nIHN0eWxlPyAgY2hlY2twYXRjaCBpc24ndCB0aGUg
YXJiaXRlciBvZiBzdHlsZSwgaWYNCj4gdGhhdCdzIHRoZSBvbmx5IHByb2JsZW0uDQo+IA0KPiBU
aGUgREVGSU5FX1BDSSBtYWNybyB3YXMgYSB3ZWxsIHJlYXNvbmVkIGFkZGl0aW9uIHdoZW4gaXQg
d2FzIGFkZGVkIGluDQo+IDIwMDguICBUaGUgcHJvYmxlbSB3YXMgbW9zdCBwZW9wbGUgd2VyZSBn
ZXR0aW5nIHRoZSBkZWZpbml0aW9uIHdyb25nLg0KPiBXaGVuIHdlIGNvbnZlcnRlZCBhd2F5IGZy
b20gQ09ORklHX0hPVFBMVUcsIGhhdmluZyB0aGlzIERFRklORV8gbWVhbnQNCj4gdGhhdCBvbmx5
IG9uZSBwbGFjZSBuZWVkZWQgY2hhbmdpbmcgaW5zdGVhZCBvZiBodW5kcmVkcyBmb3IgUENJIHRh
Ymxlcy4NCj4gDQo+IFRoZSByZWFzb24gcGVvcGxlIHdlcmUgZ2V0dGluZyB0aGUgUENJIHRhYmxl
IHdyb25nIHdhcyBtb3N0bHkgdGhlIGluaXQNCj4gc2VjdGlvbiBzcGVjaWZpZXJzIHdoaWNoIGFy
ZSBub3cgZ29uZSwgYnV0IGl0IGhhcyBlbm91Z2ggdW5kZXJseWluZw0KPiB1dGlsaXR5IChtb3N0
bHkgY29uc3RpZmljYXRpb24pIHRoYXQgSSBkb24ndCB0aGluayB3ZSdkIHdhbnQgdG8gY2h1cm4N
Cj4gdGhlIGtlcm5lbCBodWdlbHkgdG8gbWFrZSBhIGNoYW5nZSB0byBzdHJ1Y3QgcGNpX3RhYmxl
IGFuZCB0aGVuIGhhdmUgdG8NCj4gc3RhcnQgZGV0ZWN0aW5nIGFuZCBmaXhpbmcgbWlzdXNlcy4N
Cj4gDQo+IEphbWVzDQo+IA0KPiANCj4gLS0NCj4gVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxp
c3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIG5ldGRldiIgaW4NCj4gdGhlIGJvZHkgb2Yg
YSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcNCj4gTW9yZSBtYWpvcmRvbW8g
aW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sDQoNCkkg
d291bGQgcmF0aGVyIGZpeCB0aGUgbWlzdXNlcyBvZiB0aGUgbWFjcm8sIHRoYW4gcmVtb3ZlIGl0
LiBDb3VsZCB3ZQ0KcG9zc2libHkgbWFrZSBjaGVja3BhdGNoIHNtYXJ0IGVub3VnaCB0byB0ZWxs
IHdoZW4gdGhlIG1hY3JvIGlzIG1pc3VzZWQ/DQoNClRoYW5rcywNCkpha2UNCg==
