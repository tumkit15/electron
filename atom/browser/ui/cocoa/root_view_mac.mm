// Copyright (c) 2018 GitHub, Inc.
// Use of this source code is governed by the MIT license that can be
// found in the LICENSE file.

#include "atom/browser/ui/cocoa/root_view_mac.h"

#include "atom/browser/native_window.h"

namespace atom {

RootViewMac::RootViewMac(NativeWindow* window) : window_(window) {
  set_owned_by_client();
}

RootViewMac::~RootViewMac() {}

void RootViewMac::Layout() {
  if (!window_->content_view())  // Not ready yet.
    return;

  window_->content_view()->SetBoundsRect(gfx::Rect(gfx::Point(), size()));
}

gfx::Size RootViewMac::GetMinimumSize() const {
  return window_->GetMinimumSize();
}

gfx::Size RootViewMac::GetMaximumSize() const {
  return window_->GetMaximumSize();
}

}  // namespace atom
