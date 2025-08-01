#include "sgxquickresizer.h"
#include "../quickui/sgxquickinterface.h"
#include <algorithm>
#include <qtmetamacros.h>

SGXQuickResizer::SGXQuickResizer(){
    (*this).appWindowWidth = 0.0f;
    (*this).appWindowHeight = 0.0f;
    (*this).renderSpaceWidth = 0.0f;
    (*this).renderSpaceHeight = 0.0f;
    (*this).sizeUnit = 0.0f;
}

float SGXQuickResizer::getAppWindowWidth() const {
    return (*this).appWindowWidth;
}

void SGXQuickResizer::setAppWindowWidth(float x){
    (*this).appWindowWidth = x;
    emit (*this).changedAppWindowWidth();
}

float SGXQuickResizer::getAppWindowHeight() const {
    return (*this).appWindowHeight;
}

void SGXQuickResizer::setAppWindowHeight(float x){
    (*this).appWindowHeight = x;
    emit (*this).changedAppWindowHeight();
}

float SGXQuickResizer::getRenderSpaceWidth() const {
    return (*this).renderSpaceWidth;
}

void SGXQuickResizer::setRenderSpaceWidth(float x){
    (*this).renderSpaceWidth = x;
    emit (*this).changedRenderSpaceWidth();
}

float SGXQuickResizer::getRenderSpaceHeight() const {
    return (*this).renderSpaceHeight;
}

void SGXQuickResizer::setRenderSpaceHeight(float x){
    (*this).renderSpaceHeight = x;
    emit (*this).changedRenderSpaceHeight();
}

float SGXQuickResizer::getSizeUnit() const {
    return (*this).sizeUnit;
}

void SGXQuickResizer::setSizeUnit(float x){
    (*this).sizeUnit = x;
    emit (*this).changedSizeUnit();
}

void SGXQuickResizer::updateAppWindowSize(){
    setAppWindowWidth(static_cast<float>((*SGXQuickInterface::rootWindow).width()));
    setAppWindowHeight(static_cast<float>((*SGXQuickInterface::rootWindow).height()));
    if(appWindowWidth > 16.0f / 9.0f * appWindowHeight){
        setRenderSpaceWidth(16.0f / 9.0f * appWindowHeight);
        setRenderSpaceHeight(appWindowHeight);
    }
    else if(appWindowHeight > 16.0f / 9.0f * appWindowWidth){
        setRenderSpaceWidth(appWindowWidth);
        setRenderSpaceHeight(16.0f / 9.0f * appWindowWidth);
    }
    else{
        setRenderSpaceWidth(appWindowWidth);
        setRenderSpaceHeight(appWindowHeight);
    }
    setSizeUnit(std::max(renderSpaceWidth / 24.0f, renderSpaceHeight / 25.0f));
}
